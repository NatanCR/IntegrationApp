//
//  Event.swift
//  IntegrationApp
//
//  Created by Natan de Camargo Rodrigues on 24/11/23.
//

import Foundation

struct CurrentEvent: Codable {
    var currentEvent: Event?

    enum CodingKeys: String, CodingKey {
        case currentEvent = "CurrentEvent"
    }
    
    init(currentEvent: Event? = nil) {
        self.currentEvent = currentEvent
    }
}

struct Event: Codable, Identifiable {
  let id: String
  var eventName: String?
  var eventDate: String?
  var eventMembers: [Member?]?
  var quiz: [Quiz?]?
  var finance: [Finance]?
  var activeEvent: Bool?
  var task: [EventTask?]?
  var financeValidation: FinanceAnswer?

    init(id: String = UUID().uuidString, eventName: String? = nil, eventDate: String? = nil, eventMembers: [Member?]? = nil, quiz: [Quiz?]? = nil, finance: [Finance]? = nil, activeEvent: Bool? = nil, task: [EventTask?]? = nil, financeValidation: FinanceAnswer? = nil) {
        self.id = id
        self.eventName = eventName
        self.eventDate = eventDate
        self.eventMembers = eventMembers
        self.quiz = quiz
        self.finance = finance
        self.activeEvent = activeEvent
        self.task = task
        self.financeValidation = financeValidation
    }
}
