//
//  ReminderApp.swift
//  Reminder
//
//  Created by Omar Davidson II on 12/9/23.
//

import SwiftUI
import Firebase

@main
struct ReminderApp: App {
    @StateObject var vm = ReminderViewModel()
    init() {
        FirebaseApp.configure()
        print("Configured Firebase!")
    }
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
