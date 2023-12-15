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
            .refreshable {
                vm.fetchReminders()
            }
            .listStyle(.inset)
            .navigationTitle("Reminders")
            .toolbar {
                ToolbarItemGroup(placement: .primaryAction) {
                    Button(action: {
                        vm.isPresented.toggle()
                    }, label: {
                        Text("Create")
                    }).sheet(isPresented: $vm.isPresented) {
                        InputView(vm: vm)
                    }
                }
            }
            .overlay {
                if vm.reminders.isEmpty {
                    ContentUnavailableView("No Reminders Added", systemImage: "tray.fill")
                }
            }
        }
    }
//    init() {
//        vm.getData()
//    }
}

#Preview {
    MainView()
}
