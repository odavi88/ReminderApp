//
//  MainView.swift
//  Reminder
//
//  Created by Omar Davidson II on 12/9/23.
//

import SwiftUI

struct MainView: View {
    @State private var reminders: [Reminder] = []
    var body: some View {
        NavigationStack {
            Button(action: {

            }, label: {
                Text("Add")
            })
            List {
                ForEach(reminders) { reminder in
                    ListRowView()
                }
            }
            .listStyle(.inset)
            .navigationTitle("Reminders")
        }
    }
}

#Preview {
    MainView()
}
