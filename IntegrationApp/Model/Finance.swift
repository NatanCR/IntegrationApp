//
//  Finance.swift
//  IntegrationApp
//
//  Created by Natan de Camargo Rodrigues on 24/11/23.
//

import Foundation

struct Finance: Codable, Identifiable, Hashable {
    let id: String
    var title: String?
    var deadline: String?
    var totalValue: Double?
    var valuePerMembers: Double?
    var valuePayed: Double?
    var whoPayed: [WhoPayed]?
    
    init(id: String = UUID().uuidString, title: String? = nil, deadline: String? = nil, totalValue: Double? = nil, valuePerMembers: Double? = nil, valuePayed: Double? = nil, whoPayed: [WhoPayed]? = nil) {
        self.id = id
        self.title = title
        self.deadline = deadline
        self.totalValue = totalValue
        self.valuePerMembers = valuePerMembers
        self.valuePayed = valuePayed
        self.whoPayed = whoPayed
    }
}

struct WhoPayed: Codable, Hashable {
    var collaborator: Member
    var isPayed: Bool
}
