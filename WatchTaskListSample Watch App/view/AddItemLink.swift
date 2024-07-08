//
//  AddItemLink.swift
//  WatchTaskListSample Watch App
//
//  Created by Curtis on 2024/7/8.
//

import SwiftUI

struct AddItemLink: View {
    @EnvironmentObject private var model: ItemListModel
    
    var body: some View {
        TextFieldLink(prompt: Text("New Item")) {
            Label("Add", systemImage: "plus.circle.fill")
        } onSubmit: {
            model.items.append(ListItem($0))
        }
        Spacer()
            .frame(height: 5.0)
    }
}

#Preview {
    AddItemLink()
}
