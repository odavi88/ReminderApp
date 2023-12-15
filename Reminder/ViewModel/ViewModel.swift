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
    @Published var isCompleted: Bool = false
    
    
    func addData(title: String, isComplete: Bool) {
        
        isPresented = false
        
        let db = Firestore.firestore()
        let ref = db.collection("reminders").document(title)
        let randomId = UUID().uuidString
        
        ref.setData(["id": randomId, "title": title, "isComplete": isComplete])
    }
}
