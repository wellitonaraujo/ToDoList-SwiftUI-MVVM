//
//  LoginView.swift
//  TodoList
//
//  Created by Welliton da Conceicao de Araujo on 05/05/23.
//

import SwiftUI

struct LoginView: View {
    
   @StateObject var viewModel = LoginViewModel()
    
    var body: some View {
        NavigationView() {
            VStack {
                // Header
                HeaderView(title: "To Do List", subtitle: "Get things done", angle: 15, background: .purple)
                
                // Login Form
                Form {
                    TextField("Your Email", text: $viewModel.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocapitalization(.none)
                    SecureField("Your Password", text: $viewModel.password)
                        .textFieldStyle(DefaultTextFieldStyle())
                    
                    TLButtonView(title: "Log In",
                                 background: .purple
                    ) {
                            // Login action
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
