//
//  QuizAnswer.swift
//  IntegrationApp
//
//  Created by Natan de Camargo Rodrigues on 24/11/23.
//

import Foundation

struct QuizAnswer: Codable {
  let optionId: String
  var title: String?
  var votes: Int?
    
    init(optionId: String = UUID().uuidString, title: String? = nil, votes: Int? = nil) {
        self.optionId = optionId
        self.title = title
        self.votes = votes
    }
}
