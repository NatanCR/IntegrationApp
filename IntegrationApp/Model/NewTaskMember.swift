//
//  NewTaskMember.swift
//  IntegrationApp
//
//  Created by Natan de Camargo Rodrigues on 29/11/23.
//

import Foundation

struct NewTaskMember: Codable {
    let member: Member
    let id: String

    init(member: Member, id: String) {
        self.member = member
        self.id = id
    }
}
