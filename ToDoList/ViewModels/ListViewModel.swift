//
//  ListViewModel.swift
//  ToDoList
//
//  Created by Khalid on 18/11/2024.
//

import Foundation


class ListViewModel: ObservableObject{
    @Published var items: [ItemModel] = [] {
        didSet{
            saveItem()
        }
    }
    
    let itemsKey: String = "item_list"
    
    init(){
        getItems()
    }
    
    func getItems(){
        guard
            let data = UserDefaults.standard.data(forKey: itemsKey),
            let saveItems = try? JSONDecoder().decode([ItemModel].self, from: data)
        else
            {return}
        self.items = saveItems
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
    func saveItem(){
        if let encodedData = try? JSONEncoder().encode(items){
            UserDefaults.standard.setValue(encodedData, forKey: itemsKey)
        }
    }
}
