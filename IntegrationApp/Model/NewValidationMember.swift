//
//  NewValidationMember.swift
//  IntegrationApp
//
//  Created by Natan de Camargo Rodrigues on 01/12/23.
//

import Foundation

struct NewValidationMember: Codable {
    var id: String?
    var member: Member?
    
    private enum CodingKeys: String, CodingKey {
            case id
            case member = "member"
        }
    
    init(id: String? = nil, member: Member? = nil) {
        self.id = id
        self.member = member
    }
}
