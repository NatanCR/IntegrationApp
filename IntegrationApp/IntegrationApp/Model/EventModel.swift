//
//  EventModel.swift
//  IntegrationApp
//
//  Created by Natan de Camargo Rodrigues on 27/10/23.
//

import Foundation

struct EventModel: Identifiable, Codable, Hashable {
    var id: UUID = UUID()
    var eventName: String
    var eventDate: Date
    var eventMembers: [UUID: String]
    
    init(eventName: String, eventDate: Date, eventMembers: [UUID : String]) {
        self.eventName = eventName
        self.eventDate = eventDate
        self.eventMembers = eventMembers
    }
}
