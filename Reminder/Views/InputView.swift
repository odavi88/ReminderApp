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
        VStack {
            TextField("create a reminder", text: $vm.reminderTextField)
            Button(action: {
                vm.add()
            }, label: {
                Text("Add")
            })
        }
    }
}

#Preview {
    InputView(vm: ReminderViewModel())
}
