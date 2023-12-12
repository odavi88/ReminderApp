//
//  CompleteButtonView.swift
//  Reminder
//
//  Created by Omar Davidson II on 12/11/23.
//

import SwiftUI

struct CompleteButtonView: View {
    @ObservedObject var vm: ReminderViewModel
    var body: some View {
        ForEach(vm.reminders.indices, id: \.self) { index in
            Button(action: {
                vm.toggleComplete(index: index)
                }, label: {
                    Image(systemName: vm.reminders[index].isCompleted ? "checkmark.circle" : "circle" )
                        .font(.title3)
                        .fontWeight(vm.reminders[index].isCompleted ? .bold : .regular)
                })
            .foregroundStyle(.fill)
        }
    }
}

#Preview {
    CompleteButtonView(vm: ReminderViewModel())
}
