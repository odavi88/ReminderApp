//
//  ViewModel.swift
//  Reminder
//
//  Created by Omar Davidson II on 12/9/23.
//

import Foundation
import FirebaseFirestore
import Firebase

class ReminderViewModel: ObservableObject {
    @Published var reminders: [Reminder] = []
    @Published var reminderTextField: String = ""
    @Published var isPresented: Bool = false
    
    let db = Firestore.firestore()
    
    func add() {
        let reminder = Reminder(title: reminderTextField)
        reminders.append(reminder)
        reminderTextField = ""
        isPresented = false
    }
}
