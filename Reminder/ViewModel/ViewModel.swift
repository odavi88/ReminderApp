//
//  ViewModel.swift
//  Reminder
//
//  Created by Omar Davidson II on 12/9/23.
//

import Foundation

class ReminderViewModel: ObservableObject {
    @Published var reminders: [Reminder] = []
    @Published var reminderTextField: String = ""
    @Published var isPresented: Bool = false
    @Published var isCompleted: Bool = false
    
    func add() {
        let reminder = Reminder(title: reminderTextField)
        reminders.append(reminder)
        reminderTextField = ""
        isPresented = false
    }
    
    func toggleComplete(index: Int) {
        reminders[index].isCompleted.toggle()
    }
}
