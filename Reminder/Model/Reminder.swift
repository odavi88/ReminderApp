//
//  Reminder.swift
//  Reminder
//
//  Created by Omar Davidson II on 12/9/23.
//

import Foundation

struct Reminder: Identifiable {
    let id: String 
    var title: String
    var isCompleted: Bool = false
    var date: Date = Date()
}
