//
//  Formatters.swift
//  IntegrationApp
//
//  Created by Natan de Camargo Rodrigues on 28/10/23.
//

import Foundation

class Formatters {
    
    static var shared = Formatters()
    
    func dateToString(chosenDate: Date?) -> String {
        let today = Date.now
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        
        if chosenDate == nil {
            return formatter.string(from: today)
        } else {
            return formatter.string(from: chosenDate!)
        }
    }
    
    func stringToDate(dateString: String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM yyyy"
        
        if let date = dateFormatter.date(from: dateString) {
            print("Data convertida com sucesso.")
            return date
        } else {
            print("Data não pode ser convertida.")
            return nil
        }
    }
}
