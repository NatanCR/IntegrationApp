//
//  DataProcessor.swift
//  IntegrationApp
//
//  Created by Natan de Camargo Rodrigues on 30/11/23.
//

import Foundation

class DataProcessor {
    public static let shared = DataProcessor()
    
    /**Função para calcular quanto cada membro vai pagar no evento**/
    func valuePerMemberCalculate(members: Double, financeValue: Double) -> Double {
        guard members != 0 else {
            print("Total de membros igual a zero.")
            return 0.0
        }
        
        let totalPerMember = (financeValue / members)
        print(totalPerMember)
        return totalPerMember
    }
    
    /**Função para calcular quantos membros pagantes tem no evento **/
    func calculateMembersCollaborators(members: [Member]) -> Double {
        var totalMembers = 0.0
        
        if members.count != 0 {
            for _ in 0..<members.count {
                totalMembers += 1
            }
            return totalMembers
        } else {
            return 0.0
        }
    }
}
