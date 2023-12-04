//
//  Member.swift
//  IntegrationApp
//
//  Created by Natan de Camargo Rodrigues on 24/11/23.
//

import Foundation

struct Member: Codable, Identifiable, Hashable {
    let id: String
    var name: String?
    var financeMember: Bool?
    var icon: String?
    
    init(id: String = UUID().uuidString, name: String? = nil, financeMember: Bool? = nil, icon: String? = nil) {
        self.id = id
        self.name = name
        self.financeMember = financeMember
        self.icon = icon
    }
}
