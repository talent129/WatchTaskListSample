//
//  ItemListModel.swift
//  WatchTaskListSample Watch App
//
//  Created by Curtis on 2024/7/5.
//

import Foundation

// Create a model
class ItemListModel: NSObject, ObservableObject {
    @Published var items = [ListItem]()
}
