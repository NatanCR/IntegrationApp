//
//  RegisterView.swift
//  IntegrationApp
//
//  Created by Barbara Argolo on 23/11/23.
//

import SwiftUI

struct RegisterView: View {
    @StateObject private var authNewUser = AuthenticateNewUserVM()
    @Binding var tutorialState: TutorialState
    // @State var errorAlertIcon = ""
    @State private var showErrorEmail = false
    @State private var showErrorPassword = false
    @Environment (\.screenSize) var screenSize
    
    var body: some View {
        HStack {
            Spacer()
            VStack(alignment: .leading, spacing: -2) {

                Spacer()
                
                TitleComponent(title:"Cadastre-se")
                    .font(.title)
                    .foregroundColor(.segmentedControlSelected)
                    .padding(5)
                
                VStack(alignment: .leading, spacing: 20) {
                    Text(" Adicione as informações abaixo para completar o seu cadastro:")
                        .foregroundColor(.segmentedControlSelected)
                    
                    TitleComponent(title: " Nome").foregroundColor(.segmentedControlSelected)
                }
                TextFieldComponent(valueText: $authNewUser.name, placeholder: "Digite seu nome/apelido")
                    .frame(width: screenSize.width * 0.9, height: screenSize.height * 0.1)
                HStack {
                    TitleComponent(title: " E-mail")
                        .foregroundColor(.segmentedControlSelected)
                        .padding(.bottom, 5)
                    
                    if authNewUser.showAlertImage {
                        Image(systemName: "exclamationmark.circle.fill")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundColor(.red)
                    }
                }
                
                TextFieldComponent(valueText: $authNewUser.email, placeholder: "nome@snsp.idserve.net")
                    .frame(width: screenSize.width * 0.9, height: screenSize.height * 0.1)
                    .onChange(of: authNewUser.email) { _ in
                   //     authNewUser.verifyEmail(email: authNewUser.email)
                    }
                
                if showErrorEmail && !authNewUser.stateAuthenticationEmail {
                    Text(HandlingLoginErrors.AuthenticationError.emailInvalid.errorMessage)
                        .foregroundColor(.red)
                        .padding(.bottom, 5)
                }
                
                HStack {
                    TitleComponent(title: " Senha")
                        .foregroundColor(.segmentedControlSelected)
                        .padding(.bottom, 5)
                    
                    if authNewUser.showAlertImage {
                        Image(systemName: "exclamationmark.circle.fill")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundColor(.red)
                    }
                }
                
                SecureTextFieldComponent(text: $authNewUser.password, placeholder: "******")
                    .frame(width: screenSize.width * 0.9, height: screenSize.height * 0.1)
                    .onChange(of: authNewUser.password) { _ in
                    }
                
                if showErrorPassword && !authNewUser.stateAuthenticationPassword {
                    Text(HandlingLoginErrors.AuthenticationError.invalidPassword.errorMessage)
                        .foregroundColor(.red)
                        .padding(.bottom, 5)
                }
                
                
                Spacer()
                
                ColaborateComponent(title: "Próximo", action: {
                    authNewUser.verifyEmail(email: authNewUser.email)
                    authNewUser.verifyPassword(password: authNewUser.password)
                    showErrorEmail = true
                    showErrorPassword = true
                    
                    if authNewUser.stateAuthenticationEmail {
                        authNewUser.registerUser()
                        self.tutorialState = .home
                    } else if authNewUser.stateAuthenticationPassword {
                        self.tutorialState = .home
                    }
                    self.tutorialState = .introduction
                })
                .foregroundColor(.white)
            }
            Spacer()
        }
        .background(Color.apresentationView)
    }
}
//
//#Preview {
//    RegisterView()
//}
