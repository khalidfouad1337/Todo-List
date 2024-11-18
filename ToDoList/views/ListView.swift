//
//  ListView.swift
//  ToDoList
//
//  Created by Khalid on 18/11/2024.
//

import SwiftUI

struct ListView: View {
    
    @State var items : [String] = [
        "this is first item!",
        "this is second",
        "third"
    ]
    
    var body: some View {
        List{
            ForEach(items, id: \.self){ item in
                ListRowView(title: item)
            }
        }
        .listStyle(PlainListStyle())
        .navigationTitle("Todo List 📝")
        .navigationBarItems(
            leading: EditButton(),
            trailing:
        NavigationLink(
            "add",
            destination: AddView())
        )
    }
}

#Preview {
    NavigationView{
        ListView()
    }
}
