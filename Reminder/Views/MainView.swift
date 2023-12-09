//
//  MainView.swift
//  Reminder
//
//  Created by Omar Davidson II on 12/9/23.
//

import SwiftUI

struct MainView: View {
    @State private var reminders: [Reminder] = []
    @State private var titleTextField: String = ""
    var body: some View {
        NavigationStack {
            TextField("write...", text: $titleTextField)
                .textFieldStyle(.roundedBorder)
                .padding(.horizontal)
            Button(action: {
                
            }, label: {
                Text("Add")
            })
            List {

            }
            .listStyle(.insetGrouped)
            .navigationTitle("Reminders")
        }
    }
}

#Preview {
    MainView()
}
