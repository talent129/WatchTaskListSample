//
//  StressStepper.swift
//  WatchTaskListSample Watch App
//
//  Created by Curtis on 2024/7/8.
//

import SwiftUI

// Use a Stepper to edit the stress level of an item
struct StressStepper: View {
    private let stressLevels = [
        "😱", "😡", "😳", "🙁", "🫤", "🙂", "🥳"
    ]
    @State private var stressLevelIndex = 5
    
    var body: some View {
        VStack {
            Text("Stress Level")
                .font(.system(.footnote, weight: .bold))
                .foregroundStyle(.tint)
            Stepper(value: $stressLevelIndex,
                    in: (0...stressLevels.count - 1)) {
                Text(stressLevels[stressLevelIndex])
            }
        }
    }
}

#Preview {
    StressStepper()
}
