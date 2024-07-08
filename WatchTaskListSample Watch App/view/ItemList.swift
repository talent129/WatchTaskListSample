//
//  ItemList.swift
//  WatchTaskListSample Watch App
//
//  Created by Curtis on 2024/7/8.
//

import SwiftUI

struct ItemList: View {
    @EnvironmentObject private var model: ItemListModel
    
    var body: some View {
        List {
            ForEach($model.items) { $item in
                ItemRow(item: $item)
            }
            if model.items.isEmpty {
                Text("No items to do!")
                    .foregroundStyle(.gray)
            }
        }
        .toolbar{
            AddItemLink()
        }
        .navigationTitle("Tasks")
    }
}

#Preview {
    ItemList()
}
