//
//  ProductivityChart.swift
//  WatchTaskListSample Watch App
//
//  Created by Curtis on 2024/7/8.
//

import SwiftUI
import Charts

struct ProductivityChart: View {
    
    let data = ChartData.chartSampleData
    private var shortDateFormatStyle = DateFormatStyle(dateFormatTemplate: "Md")
    @State private var highlightedDateIndex: Int = 0
    @State private var crownOffset: Double = 0.0
    @State private var isCrownIdle = true
    @State var crownPositionOpacity: CGFloat = 0.2
    @State var chartDataRange = (0...6)
    
    var body: some View {
        chart
            .focusable()
            .digitalCrownRotation(
                detent: $highlightedDateIndex,
                from: 0,
                through: data.count - 1,
                by: 1,
                sensitivity: .medium
            ) { crownEvent in
                isCrownIdle = false
                crownOffset = crownEvent.offset
            } onIdle: {
                isCrownIdle = true
            }
            .onChange(of: isCrownIdle) { newValue in
                withAnimation(newValue ? .easeOut : .easeIn) {
                    crownPositionOpacity = newValue ? 0.2 : 1.0
                }
            }
            .onChange(of: highlightedDateIndex) { newValue in
                withAnimation {
                    updateChartDataRange()
                }
            }
            .navigationTitle("Productivity")
            .navigationBarTitleDisplayMode(.inline)
    }
    
    private func updateChartDataRange() {
        if (highlightedDateIndex - chartDataRange.lowerBound) < 2, chartDataRange.lowerBound > 0 {
            let newLowerBound = max(0, chartDataRange.lowerBound - 1)
            let newUpperBound = min(newLowerBound + 6, data.count - 1)
            chartDataRange = (newLowerBound...newUpperBound)
            return
        }
        if (chartDataRange.upperBound - highlightedDateIndex) < 2, chartDataRange.upperBound < data.count - 1 {
            let newUpperBound = min(chartDataRange.upperBound + 1, data.count - 1)
            let newLowerBound = max(0, newUpperBound - 6)
            chartDataRange = (newLowerBound...newUpperBound)
            return
        }
    }
    
    private var chart: some View {
        Chart(chartData) { dataPoint in
            BarMark(
                x: .value("Date", dataPoint.date),
                y: .value("Completed", dataPoint.itemsComplete)
            )
            .annotation(
                position: isLastDataPoint(dataPoint) ? .topLeading : .topTrailing,
                spacing: 0
            ) {
                Text("\(dataPoint.itemsComplete, format: .number)")
                    .foregroundStyle(dataPoint.date == crownOffsetDate ? Color.yellow : Color.clear)
            }
            RuleMark(x: .value("Date", crownOffsetDate))
                .foregroundStyle(Color.yellow.opacity(crownPositionOpacity))
        }
        .chartXAxis {
            AxisMarks { _ in
                AxisValueLabel(format: shortDateFormatStyle)
            }
        }
        .chartYAxis {
            AxisMarks { value in
                AxisGridLine(
                    stroke: StrokeStyle(lineWidth:0.5)
                )
                .foregroundStyle(Color.gray)
                if value.index < (value.count - 1) {
                    AxisValueLabel(format: IntegerFormatStyle())
                }
            }
        }
    }
    
    private var crownOffsetDate: Date {
        let dateDistance = data[0].date.distance(
            to: data[data.count - 1].date) * (crownOffset / Double(data.count - 1))
        return data[0].date.addingTimeInterval(dateDistance)
    }
    
    private func isLastDataPoint(_ dataPoint: ChartData.DataElement) -> Bool {
        data[chartDataRange.upperBound].id == dataPoint.id
    }
    
    private var chartData: [ChartData.DataElement] {
        Array(data[chartDataRange.clamped(to: (0...data.count - 1))])
    }
}

#Preview {
    ProductivityChart()
}
