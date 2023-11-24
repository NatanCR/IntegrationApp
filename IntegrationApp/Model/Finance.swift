//
//  Finance.swift
//  IntegrationApp
//
//  Created by Natan de Camargo Rodrigues on 24/11/23.
//

import Foundation

struct Finance: Codable, Identifiable {
  let id: String
  var title: String?
  var deadline: String?
  var totalValue: Double?
  var valueMembers: Int?
    
    init(id: String = UUID().uuidString, title: String? = nil, deadline: String? = nil, totalValue: Double? = nil, valueMembers: Int? = nil) {
        self.id = id
        self.title = title
        self.deadline = deadline
        self.totalValue = totalValue
        self.valueMembers = valueMembers
    }
}
