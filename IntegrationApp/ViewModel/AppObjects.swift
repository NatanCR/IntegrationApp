//
//  AppObjects.swift
//  IntegrationApp
//
//  Created by Natan de Camargo Rodrigues on 06/11/23.
//

import Foundation

class AppObjects: ObservableObject {
    public static var shared = AppObjects()
    
    @Published var tableID: String? = DataManagement.shared.getTableID()
    @Published var currentEvent = Event()
    @Published var user = Member()
    
    /**Função para atribuir o evento atual a variável**/
    func fetchCurrentEvent() async {
        if let event = await DataManagement.shared.getCurrentEvent() {
            self.currentEvent = event
        }
    }
    /**Função para criar um novo usuário membro**/
    func createUser(name: String) -> Member {
        let newMember = Member(name: name)
        return newMember
    }
    
}
