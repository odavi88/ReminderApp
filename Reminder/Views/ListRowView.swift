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
                                    .font(.title)
                                    .fontWeight(vm.reminders[index].isCompleted ? .bold : .regular)
                            }).buttonStyle(BorderlessButtonStyle())
                        .fontWeight(vm.reminders[index].isCompleted ? .bold : .thin)
                        .foregroundStyle(vm.reminders[index].isCompleted ? .gray : Color(.systemGray4))
                            VStack(alignment: .leading) {
                                Text(vm.reminders[index].title)
                                    .font(.headline)
                                Text("\(vm.reminders[index].date.formatted(date: .long, time: .shortened))")
                                    .font(.footnote)
                                    .font(.headline)
                                Text("\(vm.reminders[index].date)")
                                    .font(.caption)
                                    .foregroundStyle(.secondary)
                            }
                            Spacer()
                    }
            }.onDelete(perform: vm.delete)
    }
}

#Preview {
    ListRowView(vm: ReminderViewModel())
}
