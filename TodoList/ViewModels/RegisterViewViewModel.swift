//
//  RegisterViewModel.swift
//  TodoList
//
//  Created by Welliton da Conceicao de Araujo on 05/05/23.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class RegisterViewModel: ObservableObject {
    @Published var name = ""
    @Published var email = ""
    @Published var password = ""
    
    init(){}
    
    func rgister() {
        guard validate() else { return }
        
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
            guard let userId = result?.user.uid else {
                return
            }
            
            self?.insertUser(id: userId)
        }
    }
    
    // Insert user on db
    private func insertUser(id: String) {
        let newUser = User(id: id,
                           name: name,
                           email: email,
                           joined: Date().timeIntervalSince1970)
        
        let db = Firestore.firestore()
            db.collection("users").document(id)
            .setData(newUser.asDictionary())
    }
    
    
    private func validate() -> Bool {
        //checks if the data has blanks and/or is empty.
        guard !name.trimmingCharacters(in: .whitespaces).isEmpty,
              !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        
       // checks if the email has '@' and '.'
        guard email.contains("@") && email.contains(".") else {
            return false
        }
        
        // checks if the password has 8 or more characters
        guard password.count >= 8 else {
            return false
        }
        
        return true
    }
}


