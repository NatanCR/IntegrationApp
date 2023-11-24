//
//  AllEvents.swift
//  IntegrationApp
//
//  Created by Natan de Camargo Rodrigues on 24/11/23.
//

import Foundation

struct AllEvents: Codable, Identifiable {
    var id: String?
    var currentEvent: Event?
    var previousEvent: [Event?]?
    var wallet: Wallet?
    var users: [Login]
    
    init(id: String? = nil, currentEvent: Event? = nil, previousEvent: [Event?]? = nil, wallet: Wallet? = nil, users: [Login]) {
        self.id = id
        self.currentEvent = currentEvent
        self.previousEvent = previousEvent
        self.wallet = wallet
        self.users = users
    }
}
