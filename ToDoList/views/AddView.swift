//
//  AddView.swift
//  ToDoList
//
//  Created by Khalid on 18/11/2024.
//

import SwiftUI

struct AddView: View {
    @State var textFieldtext : String = ""
    var body: some View {
        ScrollView{
            VStack {
                TextField("Type something here ...", text: $textFieldtext)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color.cyan)
                .cornerRadius(10)
                Button(action: {
                    
                }, label: {
                    Text("save" .uppercased())
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                })
            }
            .padding(14)
        }
        .navigationTitle("Add item here 🖋️")
    }
}

#Preview {
    NavigationView{
        AddView()
    }
}
