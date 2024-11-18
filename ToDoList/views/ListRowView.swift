//
//  ListRowView.swift
//  ToDoList
//
//  Created by Khalid on 18/11/2024.
//

import SwiftUI

struct ListRowView: View {
    @State var title: String
    var body: some View {
        HStack{
            Image(systemName: "checkmark.circle")
            Text(title)
        }
    }
}

#Preview {
    ListRowView(title: "this is first item!")
}
