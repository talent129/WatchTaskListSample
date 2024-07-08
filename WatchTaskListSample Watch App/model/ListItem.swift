//
//  ListItem.swift
//  WatchTaskListSample Watch App
//
//  Created by Curtis on 2024/7/5.
//

import Foundation

// Create a list item
struct ListItem: Identifiable, Hashable {
    let id = UUID()
    var description: String
    var estimatedWork: Double = 1.0
    var creationDate: Date = Date()
    var completionDate: Date?
    
    init(_ description: String) {
        self.description = description
    }
    
    var isComplete: Bool {
        get {
            completionDate != nil
        }
        set {
            if newValue {
                guard completionDate == nil else {
                    return
                }
                completionDate = Date()
            } else {
                completionDate = nil
            }
        }
    }
}
