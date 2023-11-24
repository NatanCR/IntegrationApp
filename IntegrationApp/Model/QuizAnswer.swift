//
//  QuizAnswer.swift
//  IntegrationApp
//
//  Created by Natan de Camargo Rodrigues on 24/11/23.
//

import Foundation

struct QuizAnswer: Codable, Identifiable {
  let id: String
  var title: String?
  var votes: Int?
    
    init(id: String = UUID().uuidString, title: String? = nil, votes: Int? = nil) {
        self.id = id
        self.title = title
        self.votes = votes
    }
}
