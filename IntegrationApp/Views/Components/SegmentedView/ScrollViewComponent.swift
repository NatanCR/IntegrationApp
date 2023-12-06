//
//  ScrollViewComponent.swift
//  IntegrationApp
//
//  Created by Barbara Argolo on 06/11/23.
//

import SwiftUI

struct ScrollViewComponent: View {
    var selection: String
    @ObservedObject var objectVM: APIRequestVM
    
    var body: some View {
            VStack(spacing: 30) {
                //Enquete criada
                switch selection {
                case "Tarefa":
                    TaskSubview(objectVM: objectVM)
                case "Enquetes":
                    CreateSurveyView(objectVM: objectVM)
                case "Financeiro":
                    FinanceSubview(objectVM: objectVM)
                default:
                    TaskSubview(objectVM: objectVM)
                }
                
            }
            .frame(height: 600)
    }
}

