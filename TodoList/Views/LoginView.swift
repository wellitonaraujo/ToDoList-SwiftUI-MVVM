//
//  LoginView.swift
//  TodoList
//
//  Created by Welliton da Conceicao de Araujo on 05/05/23.
//

import SwiftUI

struct LoginView: View {
    
    @State var email = ""
    @State var password = ""
    
    var body: some View {
        NavigationView() {
            VStack {
                // Header
                HeaderView(title: "To Do List", subtitle: "Get things done", angle: 15, background: .purple)
                
                // Login Form
                Form {
                    TextField("Your Email", text: $email)
                        .textFieldStyle(DefaultTextFieldStyle())
                    TextField("Your Password", text: $password)
                        .textFieldStyle(DefaultTextFieldStyle())
                    Button {
                        // log in
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(Color.purple)
                            Text("Log In")
                                .foregroundColor(Color.white)
                        }
                    }
                    .padding()
                }
                .offset(y: -50)
                
                // Create Account
                
                VStack {
                    Text("New around here?")
                    NavigationLink("Create An Account",
                                   destination: RegisterView())
                   
                }
                .padding(.bottom, 10)
                Spacer()
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
