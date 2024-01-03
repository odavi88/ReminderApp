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
    
    let db = Firestore.firestore()
    
    init() {
        fetchReminders()
    }
    
    func addData(title: String, isComplete: Bool) {
        
        isPresented = false
        
        let ref = db.collection("reminders").document(title)
        let documentId = ref.documentID
        
        ref.setData(["id": documentId, "title": title, "isComplete": isComplete])
        reminderTextField = ""
    }
    
    func fetchReminders() {
        reminders.removeAll()
        
        let ref = db.collection("reminders")
        ref.getDocuments { snapshot, error in
            guard error == nil else {
                print(error!.localizedDescription)
                return
            }
            
            if let snapshot = snapshot {
                for document in snapshot.documents {
                    let data = document.data()
                    
                    let id = data["id"] as? String ?? ""
                    let title = data["title"] as? String ?? ""
                    let isComplete = data["isComplete"] as? Bool ?? false
                    
                    let reminder = Reminder(id: id, title: title, isCompleted: isComplete)
                    self.reminders.append(reminder)
                }
            }
        }
    }
    
    func delete(at offsets: IndexSet) {
        let ref = db.collection("reminders")
        
        let idsToDelete = offsets.map { reminders[$0].id }
        reminders.remove(atOffsets: offsets)
        
        idsToDelete.forEach { id in
            ref.document(id).delete { error in
                if let error = error {
                    print("Error deleting document with ID \(id): \(error.localizedDescription)")
                } else {
                    if let index = self.reminders.firstIndex(where: { $0.id == id }) {
                        self.reminders.remove(at: index)
                        
                        self.fetchReminders()
                    }
                }
            }
        }
    }
    
    func toggleComplete(index: Int) {
        reminders[index].isCompleted.toggle()
    }
}
