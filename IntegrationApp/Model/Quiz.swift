//
//  Quiz.swift
//  IntegrationApp
//
//  Created by Natan de Camargo Rodrigues on 24/11/23.
//

import Foundation

struct Quiz: Codable, Identifiable {
  let id: String
  var title: String?
  var category: QuizCategory?
  var answerType: AnswerType?
  var answerOptions: [QuizAnswer?]?
  var icon: String?
    
    init(id: String = UUID().uuidString, title: String? = nil, category: QuizCategory? = nil, answerType: AnswerType? = nil, answerOptions: [QuizAnswer?]? = nil, icon: String?) {
        self.id = id
        self.title = title
        self.category = category
        self.answerType = answerType
        self.answerOptions = answerOptions
        self.icon = icon
    }
}
