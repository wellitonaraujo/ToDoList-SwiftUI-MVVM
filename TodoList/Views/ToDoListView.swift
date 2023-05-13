//
//  ToDoListView.swift
//  TodoList
//
//  Created by Welliton da Conceicao de Araujo on 05/05/23.
//

import SwiftUI
import FirebaseFirestoreSwift

struct ToDoListView: View {
    @StateObject var viewModel = ToDoListViewViewModel()
    @FirestoreQuery var items: [ToDoListItem]
        
    init(userId: String) {
        self._items = FirestoreQuery(
            collectionPath: "users/\(userId)/todos"
        )
    }
    
    var body: some View {
        NavigationView {
            VStack {
                List(items) { item in
                    ToDoListItemView(item: item)
                        .swipeActions {
                            Button("Excluír") {
                                viewModel.detele(item: item)
    
                            }
                        }
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle("Minhas Tarefas")
            .toolbar {
                Button {
                    // Open to the NewItemView
                    viewModel.showingNewItemView = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $viewModel.showingNewItemView){
                NewItemView(newItemPresented: $viewModel.showingNewItemView)
            }
        }
    }
}

struct ToDoListView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListView(userId: "7CV8WDAosFWPSsmFnccCZoLq3yw1")
    }
}
