//
//  AboutApresentationView.swift
//  IntegrationApp
//
//  Created by Guilherme Borges on 13/11/23.
//

import SwiftUI

struct LoginView: View {
    @Binding var tutorialState: TutorialState
    @StateObject private var authNewUser = AuthenticateNewUserVM()
    @State var errorName = ""
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
                
                TextFieldComponent(valueText: $authNewUser.email, placeholder: "nome@snsp.idserve.net")
                    .frame(width: screenSize.width * 0.9, height: screenSize.height * 0.1)
                TitleComponent(title: " Senha").foregroundColor(.segmentedControlSelected)
                TextFieldComponent(valueText: $authNewUser.password, placeholder: "********")
                    .frame(width: screenSize.width * 0.9, height: screenSize.height * 0.1)
                
                Text(errorName)
                Spacer()
                ColaborateComponent(title: "Próximo", action: {
                    
                        self.tutorialState = .home
                        //  authNewUser.nextButtonTapped()

                })
                .foregroundColor(.white)
            }
            Spacer()
        }
        .background(Color.apresentationView)
    }
}

//struct AcessApresentationView: View {
//    @Binding var tutorialState: TutorialState
//    @StateObject private var authNewUser = AuthenticateNewUserVM()
//    @Environment (\.screenSize) var screenSize
//
//    var body: some View {
//        HStack {
//            Spacer()
//            VStack(alignment: .leading, spacing: -2) {
//                Spacer()
//                TitleComponent(title:"Acesso")
//                    .font(.title)
//                    .foregroundColor(.segmentedControlSelected)
//                    .padding(5)
//
//                VStack(alignment: .leading, spacing: 20){
//                    Text(" Para utilizar o aplicativo é necessário ter\n acesso, insira os seus dados abaixo:")
//                        .foregroundColor(.segmentedControlSelected)
//
//                    TitleComponent(title: " E-mail").foregroundColor(.segmentedControlSelected)
//
//                    TextFieldComponent(text: $authNewUser.email, placeholder: "nome@snsp.idserve.net")
//                        .frame(width: screenSize.width * 0.9, height: screenSize.height * 0.1)
//
//                    TitleComponent(title: " Senha").foregroundColor(.segmentedControlSelected)
//
//                    TextFieldComponent(text: $authNewUser.password, placeholder: "********")
//                        .frame(width: screenSize.width * 0.9, height: screenSize.height * 0.1)
//
//                    Text(authNewUser.stateError)
//                        .foregroundColor(.red)
//                        .padding(.bottom, 5)
//
//                    Spacer()
//
//                    ColaborateComponent(title: "Próximo", action: {
//                        authNewUser.verifyEmail(email: authNewUser.email)
//                        authNewUser.verifyPassword(password: authNewUser.password)
//
//                        if authNewUser.stateAuthenticationEmail {
//                            self.tutorialState = .home
//                        } else if authNewUser.stateAuthenticationPassword {
//                            self.tutorialState = .home
//                        }
//                    })
//                    .foregroundColor(.white)
//                }
//            }
//            Spacer()
//        }
//        .background(Color.apresentationView)
//    }
//}


//#Preview {
//    AccessApresentationView()
//}
