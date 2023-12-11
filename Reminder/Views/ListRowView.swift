//
//  ListRowView.swift
//  Reminder
//
//  Created by Omar Davidson II on 12/11/23.
//

import SwiftUI

struct ListRowView: View {
    @ObservedObject var vm: ReminderViewModel
    var body: some View {
        HStack {
            ForEach(vm.reminders) { reminder in
                Image(systemName: "circle")
                Text(reminder.title)
                Image(systemName: "info.circle")
            }
        }
    }
}

#Preview {
    ListRowView(vm: ReminderViewModel())
}
