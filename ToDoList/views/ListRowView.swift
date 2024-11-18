//
//  ListRowView.swift
//  ToDoList
//
//  Created by Khalid on 18/11/2024.
//

import SwiftUI

struct ListRowView: View {
    let item: ItemModel
    var body: some View {
        HStack{
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                .foregroundColor(item.isCompleted ? .green : .red)
            Text(item.title)
        }
        .font(.title2)
        .padding(.horizontal, 8)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let item1 = ItemModel(title: "first item", isCompleted: false)
        let item2 = ItemModel(title: "second item", isCompleted: true)
        
        return Group {
            ListRowView(item: item1)
            ListRowView(item: item2)
        }
        .previewLayout(.sizeThatFits)
    }
}
