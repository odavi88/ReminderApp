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
                        VStack(alignment: .leading) {
                            Text(vm.reminders[index].title)
                            Text("10:45 am")
                                .font(.caption)
                                .foregroundStyle(.secondary)
                        }
                        Spacer()
                        Image(systemName: "info.circle")
                    }
            }.onDelete(perform: vm.delete)
    }
}

#Preview {
    ListRowView(vm: ReminderViewModel())
}
