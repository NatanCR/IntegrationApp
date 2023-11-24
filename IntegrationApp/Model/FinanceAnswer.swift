//
//  FinanceAnswer.swift
//  IntegrationApp
//
//  Created by Natan de Camargo Rodrigues on 24/11/23.
//

import Foundation

struct FinanceAnswer: Codable, Identifiable {
  let id: String
  var title: String?
  var collaborators: [Member?]?
    
    init(id: String = UUID().uuidString, title: String? = nil, collaborators: [Member?]? = nil) {
        self.id = id
        self.title = title
        self.collaborators = collaborators
    }
}
