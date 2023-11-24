//
//  Wallet.swift
//  IntegrationApp
//
//  Created by Natan de Camargo Rodrigues on 24/11/23.
//

import Foundation

public struct Wallet: Codable, Identifiable {
    public let id: String?
    public var value: Double?
    
    public init(id: String = UUID().uuidString, value: Double? = nil) {
        self.id = id
        self.value = value
    }
}
