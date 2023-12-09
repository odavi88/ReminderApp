//
//  ListRowView.swift
//  Reminder
//
//  Created by Omar Davidson II on 12/9/23.
//

import SwiftUI

struct ListRowView: View {
    @State private var titleTextField: String = ""
    var body: some View {
        HStack {
            Image(systemName: "circle")
                .font(.title)
//                .padding(.leading)
            Spacer()
            TextField("", text: $titleTextField)
            Spacer()
            Image(systemName: "info.circle")
                .font(.title)
//                .padding(.trailing)
        }
    }
}

#Preview {
    ListRowView()
}
