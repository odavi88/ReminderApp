//
//  InputView.swift
//  Reminder
//
//  Created by Omar Davidson II on 12/9/23.
//

import SwiftUI

struct InputView: View {
    @ObservedObject var vm: ReminderViewModel
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                TextField("create a reminder", text: $vm.reminderTextField)
                    .textFieldStyle(.roundedBorder)
                    .padding(.horizontal)
                DatePicker("Select a Date & Time", selection: $vm.selectedDate)
                    .labelsHidden()
                    .padding()
                Spacer()
            }
            .toolbar {
                Button(action: {
                    vm.addData(title: vm.reminderTextField, isComplete: vm.isCompleted, date: vm.selectedDate)
                }, label: {
                    Text("Add")
                })
            }
        }
    }
}

#Preview {
    InputView(vm: ReminderViewModel())
}
