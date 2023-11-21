//
//  AuthenticateNewUserVM.swift
//  IntegrationApp
//
//  Created by Barbara Argolo on 17/11/23.
//

import SwiftUI

class AuthenticateNewUserVM: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var tutorialState: TutorialState?
    
    func registerUser() {
        
      //  verifyPassowrd(password: password)
        
        let url = URL(string: "http://127.0.0.1:5000/registerUser?email=\(email)&password=\(password)")!
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

    func nextButtonTapped() {
     
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.tutorialState = .identity
        }
    }
    //verificar se a senha tem seis digitos ou mais
    
//    func verifyEmail(email: String) {
//        // Check if email has the domain "@gmail.com"
//        let emailPattern = "^[^@]+@gmail\\.com$"
//        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailPattern)
//        if !emailPredicate.evaluate(with: email) {
//            print("Email must be a Gmail address")
//            return
//        }
//        
//    }
//    func verifyPassowrd(password: String) {
//        let passwordPattern = "^.{6,}$"
//        let passwordPredicate = NSPredicate(format: "SELF MATCHES %@", passwordPattern)
//        if !passwordPredicate.evaluate(with: password) {
//            print("Password must be at least 6 characters long")
//            return
//        }
//    }
}
