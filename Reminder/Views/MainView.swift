//
//  MainView.swift
//  Reminder
//
//  Created by Omar Davidson II on 12/9/23.
//

import SwiftUI

struct MainView: View {
    @StateObject var vm = ReminderViewModel()
    @State private var reminders: [Reminder] = []
    @State private var reminderTextfield: String = ""
    var body: some View {
        NavigationStack {
            List {
                ForEach(vm.reminders) { reminder in
                    Text(reminder.title)
                }
            }
            .listStyle(.inset)
            .navigationTitle("Reminders")
            .toolbar {
                ToolbarItemGroup(placement: .primaryAction) {
                    Button(action: {
                        
                    }, label: {
                        Text("Create")
                    })
                }
            }
        }
    }
}

#Preview {
    MainView()
}
