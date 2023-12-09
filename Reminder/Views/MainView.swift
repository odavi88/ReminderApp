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
            List {

            }
            .listStyle(.insetGrouped)
            .navigationTitle("Reminders")
        }
    }
}

#Preview {
    MainView()
}
