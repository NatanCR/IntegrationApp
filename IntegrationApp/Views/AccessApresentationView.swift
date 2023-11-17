//
//  AboutApresentationView.swift
//  IntegrationApp
//
//  Created by Guilherme Borges on 13/11/23.
//

import SwiftUI

struct AcessApresentationView: View {
    @Binding var tutorialState: TutorialState
    @State var email: String
    @State var password: String
    @Environment (\.screenSize) var screenSize
    
    var body: some View {
        HStack {
            Spacer()
            VStack(alignment: .leading, spacing: -2) {
                Spacer()
                TitleComponent(title:"Acesso")
                    .font(.title)
                    .foregroundColor(.segmentedControlSelected)
                    .padding(5)
                
                VStack(alignment: .leading, spacing: 20){
                    Text(" Para utilizar o aplicativo é necessário ter\n acesso, insira o seus dados abaixo:")
                        .foregroundColor(.segmentedControlSelected)
                    
                    TitleComponent(title: " E-mail").foregroundColor(.segmentedControlSelected)
                }
                
                TextFieldComponent(text: $email, placeholder: "nome@snsp.idserve.net")
                    .frame(width: screenSize.width * 0.9, height: screenSize.height * 0.1)
                TitleComponent(title: " Senha").foregroundColor(.segmentedControlSelected)
                TextFieldComponent(text: $password, placeholder: "********")
                    .frame(width: screenSize.width * 0.9, height: screenSize.height * 0.1)
                
                Spacer()
                ColaborateComponent(title: "Próximo", action: {
                    tutorialState = .identity
                })
                .foregroundColor(.white)
                Spacer()
            }
            .background(Color.apresentationView)
        }
    }
}


//#Preview {
//    AccessApresentationView()
//}
