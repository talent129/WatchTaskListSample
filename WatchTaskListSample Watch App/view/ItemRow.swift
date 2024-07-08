//
//  ItemRow.swift
//  WatchTaskListSample Watch App
//
//  Created by Curtis on 2024/7/8.
//

import SwiftUI

struct ItemRow: View {
    @EnvironmentObject private var model: ItemListModel
    @Binding var item: ListItem
    @State private var showDetail = false
    var body: some View {
        Button(action: {
            showDetail = true
        }, label: {
            Text(item.description)
        })
        .sheet(isPresented: $showDetail, content: {
            ItemDetail(item: $item)
                .toolbar {
                    ToolbarItem(placement: .confirmationAction) {
                        Button("Done") {
                            showDetail = false
                        }
                    }
                }
        })
    }
}

#Preview {
    ItemRow(item: .constant(ListItem("Build an app!")))
}
