//
//  MainView.swift
//  Reminder
//
//  Created by Omar Davidson II on 12/9/23.
//

import SwiftUI

struct MainView: View {
    @State private var reminders: [Reminder] = [
        Reminder(title: "")
    ]
    var body: some View {
        NavigationStack {
            Button(action: {
//                addReminder()
            }, label: {
                Text("Add")
            })
            List {
                ForEach(reminders) { reminder in
                    ListRowView()
                }
            }
            .listStyle(.inset)
            .navigationTitle("Reminders")
        }
    }
//    func addReminder() {
//        let reminder = Reminder(title: titleTextField)
//        reminders.append(reminder)
//        titleTextField = ""
//    }
}

#Preview {
    MainView()
}
