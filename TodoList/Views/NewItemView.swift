//
//  NewItemView.swift
//  TodoList
//
//  Created by Welliton da Conceicao de Araujo on 05/05/23.
//

import SwiftUI

struct NewItemView: View {
    @StateObject var viewModel = NewItemViewViewModel()
    @Binding var newItemPresented: Bool
    
    var body: some View {
        VStack {
            Text("Nova tarefa")
                .font(.system(size: 32))
                .bold()
                .padding(.top, 50)
            
            Form {
                // Title
                TextField("Tarefa", text: $viewModel.title)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                // Date
                DatePicker("Date", selection: $viewModel.dueDate)
                    .datePickerStyle(GraphicalDatePickerStyle())
                
                // Action
                TLButtonView(
                    title: "Salvar",
                    background: .purple
                ) {
                    if viewModel.canSave {
                        viewModel.save()
                        newItemPresented = false
                    } else {
                        viewModel.showAlert = true                    }
                }
                .padding()
            }
            .alert(isPresented: $viewModel.showAlert) {
                Alert(title: Text("Error"), message: Text("Please fill in all fields and select due date that is today or newer."))
            }
        }
    }
}

struct NewItemView_Previews: PreviewProvider {
    static var previews: some View {
        NewItemView(newItemPresented: Binding(get: {
            return true
        }, set: { _ in
            
        }))
    }
}
