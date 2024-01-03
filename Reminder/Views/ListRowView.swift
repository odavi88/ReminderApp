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
            ForEach(vm.reminders.indices, id: \.self) { index in
                HStack {
                    Button(action: {
                        vm.toggleComplete(index: index)
                    }, label: {
                        Image(systemName: vm.reminders[index].isCompleted ? "checkmark.circle" : "circle" )
                            .font(.title3)
                            .fontWeight(vm.reminders[index].isCompleted ? .bold : .regular)
                    })
                    .fontWeight(vm.reminders[index].isCompleted ? .bold : .thin)
                    .foregroundStyle(.gray)
                    Text(vm.reminders[index].title)
                }
            }
    }
}

#Preview {
    ListRowView(vm: ReminderViewModel())
}
