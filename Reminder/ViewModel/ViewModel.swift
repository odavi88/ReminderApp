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
    
    
    
    func getData() {
        let db = Firestore.firestore()
        
        db.collection("reminders").getDocuments { snapshot, error in
            if error == nil {
                if let snapshot = snapshot {
                    
                    DispatchQueue.main.async {
                        self.reminders = snapshot.documents.map { doc in
                            return Reminder(
                                title: doc["title"] as? String ?? "",
                                isCompleted: doc[false] as? Bool ?? false)
                        }
                    }
                }
            } else {
                
            }
        }
    }
    
    func addData(title: String, isComplete: Bool) {
        
        let reminder = Reminder(title: reminderTextField)
        reminders.append(reminder)
        reminderTextField = ""
        isPresented = false
        
        let db = Firestore.firestore()
        
        db.collection("reminders").addDocument(data: ["title": title, "isComplete": isComplete]) { error in
            if error == nil {
                self.getData()
            } else {
                
            }
        }
    }
    
    func toggleComplete(index: Int) {
        reminders[index].isCompleted.toggle()
    }
}
