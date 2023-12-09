//
//  MainView.swift
//  Reminder
//
//  Created by Omar Davidson II on 12/9/23.
//

import SwiftUI

struct MainView: View {
    @State private var reminders: [Reminder] = []
    @State private var titleTextField: String = ""
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
