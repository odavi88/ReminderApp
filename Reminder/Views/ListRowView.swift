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
                        CompleteButtonView(vm: vm)
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
