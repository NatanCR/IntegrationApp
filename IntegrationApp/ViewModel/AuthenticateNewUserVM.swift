//
//  AuthenticateNewUserVM.swift
//  IntegrationApp
//
//  Created by Barbara Argolo on 17/11/23.
//

import SwiftUI

class AuthenticateNewUserVM: ObservableObject {
    @Published var manipulateError = HandlingLoginErrors()
    @Published var showAlertImage = false
    @Published var stateAuthenticationEmail = false
    @Published var stateAuthenticationPassword = false
    @Published var stateError = ""
    @Published var name = ""
    @Published var email = ""
    @Published var password = ""
    @Published var passwordConfirmation = ""
    
    func registerUser() {
        let url = URL(string: "http://127.0.0.1:5000/register?email=\(email)&password=\(password)")!
        print("url do usuario \(url)")
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("Error: \(error)")
            } else if let data = data {
                let str = String(data: data, encoding: .utf8)
                print("Received data:\n\(str ?? "")")
            }
        }
        task.resume()
    }
    
    func verifyEmail(email: String) {
        let emailPattern = "^[^@]+@gmail.com$"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailPattern)
        if !emailPredicate.evaluate(with: email) {
            let error = HandlingLoginErrors.AuthenticationError.emailInvalid
            print("Email must be a Gmail address")
            manipulateError.changeStateErrorRegister(error: error)
            self.stateError = error.rawValue
            self.showAlertImage = true
            return
        }
        
        // Verifique se o e-mail está associado a uma conta existente
        if !emailIsAssociatedWithAccount(email) {
            let error = HandlingLoginErrors.AuthenticationError.emailNotConnected
            print("O endereço de e-mail que você inseriu não está associado a uma conta. Encontre sua conta e faça login.")
            manipulateError.changeStateErrorRegister(error: error)
            self.stateError = error.rawValue
            self.showAlertImage = true
            return
        }
        
        stateAuthenticationEmail.toggle()
        print("O estado da autenticação de e-mail é: \(stateAuthenticationEmail)")
    }
    
    private func emailIsAssociatedWithAccount(_ email: String) -> Bool {
        //firebase
      
         return true
     }


    func verifyPassword(password: String) {
        let passwordPattern = "^.{6,}$"
        let passwordPredicate = NSPredicate(format: "SELF MATCHES %@", passwordPattern)
        if !passwordPredicate.evaluate(with: password) {
            let error = HandlingLoginErrors.AuthenticationError.invalidPassword
            print("Password must be at least 6 characters long")
            manipulateError.changeStateErrorRegister(error: error)
            self.showAlertImage = true
            return
        }
        stateAuthenticationPassword.toggle()
        print("O estado da autenticação da senha é: \(stateAuthenticationPassword)")
    }
}
