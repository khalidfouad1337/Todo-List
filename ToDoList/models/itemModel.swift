//
//  itemModel.swift
//  ToDoList
//
//  Created by Khalid on 18/11/2024.
//

import Foundation


// Immutable Struct

struct ItemModel : Identifiable, Codable {
    let id: String
    let title: String
    let isCompleted : Bool
    
    init(id: String = UUID().uuidString, title: String, isCompleted: Bool) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }
    
    func updateCompletion() -> ItemModel{
        return ItemModel(id: id, title: title, isCompleted: !isCompleted)
    }
}
