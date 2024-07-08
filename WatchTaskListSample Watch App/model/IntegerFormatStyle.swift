//
//  IntegerFormatStyle.swift
//  WatchTaskLiskSample Watch App
//
//  Created by Layer on 2022/6/26.
//

import Foundation

/// `ProductivityChart` uses this type to format the values on the y-axis.
struct IntegerFormatStyle: FormatStyle {
    func format(_ value: Double) -> String {
        " \(Int(value))"
    }
}
