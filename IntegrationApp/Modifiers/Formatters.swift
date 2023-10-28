//
//  Formatters.swift
//  IntegrationApp
//
//  Created by Natan de Camargo Rodrigues on 28/10/23.
//

import Foundation

class Formatters {
    
    static var shared = Formatters()
    
    func currentDateToString() -> String {
        let today = Date.now
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        
        return formatter.string(from: today)
    }
}
