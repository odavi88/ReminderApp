//
//  MainView.swift
//  Reminder
//
//  Created by Omar Davidson II on 12/9/23.
//

import SwiftUI

struct MainView: View {
    @State private var reminders: [Reminder] = []
    @State private var reminderTextfield: String = ""
    var body: some View {
        NavigationStack {
            TextField("create a reminder", text: $reminderTextfield)
            Button(action: {
                add()
            }, label: {
                Text("Add")
            })
            List {
                ForEach(reminders) { reminder in
                    Text(reminder.title)
                }
            }
            .listStyle(.inset)
            .navigationTitle("Reminders")
        }
    }
    func add() {
        let reminder = Reminder(title: reminderTextfield)
        reminders.append(reminder)
        reminderTextfield = ""
    }
}

#Preview {
    MainView()
}
