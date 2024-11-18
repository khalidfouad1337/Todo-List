//
//  ListViewModel.swift
//  ToDoList
//
//  Created by Khalid on 18/11/2024.
//

import Foundation


class ListViewModel: ObservableObject{
    @Published var items: [ItemModel] = []
    
    init(){
        getItems()
    }
    
    func getItems(){
        let newItems = [
            ItemModel(title: "this is first item", isCompleted: false),
            ItemModel(title: "this is second", isCompleted: true),
            ItemModel(title: "third!", isCompleted: false)
        ]
        items.append(contentsOf: newItems)
    }
    func deleteItem(indexSet : IndexSet){
        items.remove(atOffsets: indexSet)
    }
    func moveItem(from : IndexSet, to: Int){
        items.move(fromOffsets: from, toOffset: to)
    }
    func addItem(title: String){
        let newItem = ItemModel(title: title, isCompleted: false)
        items.append(newItem)
    }
    func updateItem(item : ItemModel){
        if let index = items.firstIndex(where: { $0.id == item.id })
        {
            items[index] = item.updateCompletion()
        }
    }
}
