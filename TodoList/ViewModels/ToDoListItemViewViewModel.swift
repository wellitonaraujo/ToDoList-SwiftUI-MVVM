//
//  ToDoListItemViewViewModel.swift
//  TodoList
//
//  Created by Welliton da Conceicao de Araujo on 07/05/23.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class ToDoListItemViewViewModel: ObservableObject {
    init() {}
        
        func toggleIsDone(item: ToDoListItem) {
            var itemCopy = item
            itemCopy.setDone(!item.isDone)
            
            guard let uid = Auth.auth().currentUser?.uid else {
                return
            }
            
            let db = Firestore.firestore()
            db.collection("users")
                .document(uid)
                .collection("todos")
                .document(itemCopy.id)
                .setData(itemCopy.asDictionary())
        }
    }

