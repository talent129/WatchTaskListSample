//
//  WatchTaskListSampleApp.swift
//  WatchTaskListSample Watch App
//
//  Created by Curtis on 2024/7/5.
//

import SwiftUI

// Add the model as an environment object

@main
struct WatchTaskListSample_Watch_AppApp: App {
    @StateObject var itemListModel = ItemListModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(itemListModel)
        }
    }
}
