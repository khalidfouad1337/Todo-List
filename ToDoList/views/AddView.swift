//
//  AddView.swift
//  ToDoList
//
//  Created by Khalid on 18/11/2024.
//

import SwiftUI

struct AddView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel: ListViewModel
    @State var textFieldtext : String = ""
    
    @State var alerttitle: String = ""
    @State var showAlert : Bool = false
    
    var body: some View {
        ScrollView{
            VStack {
                TextField("Type something here ...", text: $textFieldtext)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color.cyan)
                .cornerRadius(10)
                Button(action: saveButtonPressed, label: {
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
        .alert(isPresented: $showAlert, content: getAlert)
    }
    func saveButtonPressed(){
        if textIsAppropritae(){
            listViewModel.addItem(title: textFieldtext)
            presentationMode.wrappedValue.dismiss()
        }
    }
    func textIsAppropritae() -> Bool {
        if textFieldtext.count < 3 {
            alerttitle = "you new todo item must be at least 3 characteres long!! 😨"
            showAlert.toggle()
            return false
        }
        return true
    }
    func getAlert() -> Alert{
        return Alert(title: Text(alerttitle))
    }
}

#Preview {
    NavigationView{
        AddView()
    }
    .environmentObject(ListViewModel())
}
