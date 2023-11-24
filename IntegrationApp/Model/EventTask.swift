//
//  EventTask.swift
//  IntegrationApp
//
//  Created by Natan de Camargo Rodrigues on 24/11/23.
//

import Foundation

struct EventTask: Codable, Identifiable {
  let id: String
  var title: String?
  var deadline: String?
  var collaborators: [Member?]?
  var status: Status?
  var icon: String?
    
    init(id: String = UUID().uuidString, title: String? = nil, deadline: String? = nil, collaborators: [Member?]? = nil, status: Status? = nil, icon: String? = nil) {
        self.id = id
        self.title = title
        self.deadline = deadline
        self.collaborators = collaborators
        self.status = status
        self.icon = icon
    }
}
