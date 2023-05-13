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
                HeaderView(title: "Tarefas",
                           subtitle: "Fazer ou não fazer",
                           angle: 15,
                           background: .purple)
        
                // Login Form
                Form {
                    if !viewModel.errorMessage.isEmpty {
                        Text(viewModel.errorMessage)
                            .foregroundColor(Color.red)
                    }
                    
                    TextField("Seu email", text: $viewModel.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocapitalization(.none)
                    SecureField("Sua senha", text: $viewModel.password)
                        .textFieldStyle(DefaultTextFieldStyle())

                    TLButtonView(title: "ENTRAR",
                                 background: .purple
                    ) {
                        viewModel.login()
                    }
                    .padding()
                } // - FORM
                .offset(y: -50)
                
                // Create Account
                VStack {
                    Text("Novo por aqui??")
                    NavigationLink("Criar uma conta",
                                   destination: RegisterView())
                   
                }
                .padding(.bottom, 10)
                Spacer()
            } // HSTACK
        } // NAVIGATION VIEW
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
