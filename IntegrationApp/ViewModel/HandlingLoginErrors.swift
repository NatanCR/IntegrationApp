//
//  HandlingLoginErrors.swift
//  IntegrationApp
//
//  Created by Barbara Argolo on 23/11/23.
//

import Foundation
import SwiftUI

class HandlingLoginErrors {
    @State var handlingError = false
    
    enum AuthenticationError: String {
        case emailInvalid = "EmailInvalid"
        case invalidPassword = "Password"
        case emailAndPasswordMismatch = "EmailAndPassword"
        case accountDoesntExist = "AccountDoesntExists"
        case emailNotConnected = "EmailNotConnected"


        var errorMessage: String {
            switch self {
            case .emailInvalid:
                return "O Email deve ser um endereço @snsp.idserve.net"
            case .invalidPassword:
                return "A senha deve conter pelo menos 6 caracteres."
            case .emailAndPasswordMismatch:
                return "E-mail ou senhas incorretas."
            case .accountDoesntExist:
                return "Você ainda não possui uma conta."
                
              //  "The email address you entered isn't connected to an account. Find your account and log in."
            case .emailNotConnected:
                return "O endereço de e-mail que você inseriu não está associado a uma conta. Encontre sua conta e faça login."
            }
        }
    }
    
    func changeStateErrorRegister(error: AuthenticationError) {
        print(error.errorMessage)
    }
    
    func changeStateErrorAccess(error: AuthenticationError) {
        print(error.errorMessage)
    }
}
