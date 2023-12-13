//
//  ReminderApp.swift
//  Reminder
//
//  Created by Omar Davidson II on 12/9/23.
//

import SwiftUI
import FirebaseCore



@main
struct ReminderApp: App {
    init() {
        Firebase.configure()
            print("Configured Firebase!")
    }
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
