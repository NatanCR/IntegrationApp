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
    @Published var loginState = false
    @Published var stateError = ""
    @Published var name = ""
    @Published var email = ""
    @Published var password = ""
    @Published var passwordConfirmation = ""
    
    func registerUser() {
        let url = URL(string: "https://python-api-henna-pi.vercel.app/register?email=\(email)&password=\(password)")!
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
    //diminuir essa func
    func loginUser(email: String, password: String) {
        guard let url = URL(string: "https://python-api-henna-pi.vercel.app/login") else {
            print("Não foi possível encontrar a URL")
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        let parameters: [String: Any] = [
            "email": email,
            "password": password
        ]

        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
        } catch let error {
            print("Erro ao serializar os parâmetros: \(error.localizedDescription)")
            return
        }

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Erro na solicitação: \(error.localizedDescription)")
                return
            }

            guard let data = data else {
                print("Dados vazios na resposta.")
                return
            }

            do {
                let jsonResponse = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]

                if let status = jsonResponse?["status"] as? String, status == "success" {
                    print("Login bem-sucedido!")
                    DispatchQueue.main.async {
                          self.loginState.toggle()
                      }
                } else {
                    print("Falha no login. Verifique as credenciais.")
                }
            } catch let error {
                print("Erro ao analisar os dados da resposta: \(error.localizedDescription)")
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
