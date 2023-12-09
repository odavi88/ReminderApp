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
                addReminder()
            }, label: {
                Text("Add")
            })
            List {
                ForEach(reminders) { reminder in
                    Text(reminder.title)
                }
            }
            .listStyle(.insetGrouped)
            .navigationTitle("Reminders")
        }
    }
    func addReminder() {
        let reminder = Reminder(title: titleTextField)
        reminders.append(reminder)
        titleTextField = ""
    }
}

#Preview {
    MainView()
}
