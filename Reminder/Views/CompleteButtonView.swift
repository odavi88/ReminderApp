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
        Button(action: {
            vm.isCompleted.toggle()
        }, label: {
            Image(systemName: vm.isCompleted ? "checkmark.circle" : "circle" )
                .font(.title3)
                .fontWeight(vm.isCompleted ? .bold : .regular)
        })
        .foregroundStyle(.fill)
    }
}

#Preview {
    CompleteButtonView(vm: ReminderViewModel())
}
