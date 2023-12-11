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
            ForEach(vm.reminders) { reminder in
                    HStack {
                        Image(systemName: vm.isCompleted ? "checkmark.circle" : "circle" )
                        Text(reminder.title)
                        Spacer()
                        Image(systemName: "info.circle")
                    }
            }
    }
}

#Preview {
    ListRowView(vm: ReminderViewModel())
}
