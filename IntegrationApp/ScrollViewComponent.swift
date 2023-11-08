//
//  ScrollViewComponent.swift
//  IntegrationApp
//
//  Created by Barbara Argolo on 06/11/23.
//

import SwiftUI

struct ScrollViewComponent: View {
    var selection: String
    
    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                //Enquete criada
                
                switch selection {
                case "Tarefa":
                    TaskSubview()
                case "Enquetes":
                    QuizzesSubview()
                case "Financeiro":
                    FinanceSubview()
                default:
                    TaskSubview()
                }
                
            }.frame(height: 800)
                .ignoresSafeArea()
                
        }
    }
}

