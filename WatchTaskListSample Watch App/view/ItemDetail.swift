//
//  ItemDetail.swift
//  WatchTaskListSample Watch App
//
//  Created by Curtis on 2024/7/8.
//

import SwiftUI

struct ItemDetail: View {
    @Binding var item: ListItem
    var body: some View {
        Form {
            Section("List Item") {
                TextField("Item", text: $item.description, prompt: Text("List Item"))
            }
            Stepper(value: $item.estimatedWork,
                    in: (0.0...14.0),
                    step: 0.5,
                    format: .number) {
                Text("\(item.estimatedWork, specifier: "%.1f")days")
            }
            Toggle(isOn: $item.isComplete, label: {
                Text("Completed")
            })
            ShareLink(item: item.description,
                      subject: Text("Please help!"),
                      message: Text("(I need some help finishing this.)"),
                      preview: SharePreview("\(item.description)"))
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.roundedRectangle)
            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
        }
    }
}

#Preview {
    ItemDetail(item: .constant(ListItem("Build an app!")))
}
