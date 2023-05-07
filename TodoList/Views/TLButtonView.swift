//
//  TLButtonView.swift
//  TodoList
//
//  Created by Welliton da Conceicao de Araujo on 06/05/23.
//

import SwiftUI

struct TLButtonView: View {
    let title: String
    let background: Color
    let action: () -> Void
    
    var body: some View {
            Button {
                action()
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(background)
                    Text(title)
                        .font(.system(size: 18))
                        .foregroundColor(Color.white)
                        .bold()
         
                }
            }
    }
}

struct TLButtonView_Previews: PreviewProvider {
    static var previews: some View {
        TLButtonView(title: "Value",
                     background: .purple) {
            // Action
        }
    }
}
