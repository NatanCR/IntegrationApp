//
//  Login.swift
//  IntegrationApp
//
//  Created by Natan de Camargo Rodrigues on 24/11/23.
//

import Foundation

struct Login: Codable, Identifiable, Hashable {
    let id: String?
    var name: String?
    var email: String?
    var password: String?
    
    init(id: String? = UUID().uuidString, name: String? = nil, email: String? = nil, password: String? = nil) {
        self.id = id
        self.name = name
        self.email = email
        self.password = password
    }
}
