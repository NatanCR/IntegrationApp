//
//  AppObjects.swift
//  IntegrationApp
//
//  Created by Natan de Camargo Rodrigues on 06/11/23.
//

import Foundation

class AppObjects: ObservableObject {
    public static var shared = AppObjects()
    
    @Published var tableID: String = DataManagement.shared.getTableID()
}
