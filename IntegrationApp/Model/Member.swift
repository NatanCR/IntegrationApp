//
//  Member.swift
//  IntegrationApp
//
//  Created by Natan de Camargo Rodrigues on 24/11/23.
//

import Foundation

struct Member: Codable, Identifiable {
  let id: String
  var name: String?
  var financeMember: Bool?
    
    init(id: String = UUID().uuidString, name: String? = nil, financeMember: Bool? = nil) {
        self.id = id
        self.name = name
        self.financeMember = financeMember
    }
}
