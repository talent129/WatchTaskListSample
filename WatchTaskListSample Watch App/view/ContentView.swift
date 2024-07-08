//
//  ContentView.swift
//  WatchTaskListSample Watch App
//
//  Created by Curtis on 2024/7/5.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            NavigationStack {
                ItemList()
            }
            NavigationStack {
                ProductivityChart()
            }
        }
        .tabViewStyle(.page)
    }
}

#Preview {
    ContentView()
}
