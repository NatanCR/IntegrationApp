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
//        ScrollView {
            VStack(spacing: 30) {
                //Enquete criada
                switch selection {
                case "Tarefa":
                    TaskSubview()
                case "Enquetes":
                    QuizzesSubview()
                case "Financeiro":
                    FinanceSubview(objectVM: objectVM)
                default:
                    TaskSubview()
                }
                
            }
            .frame(height: 600)
//            .ignoresSafeArea()
////        }
//        .padding(.top, 10)
//        .padding(.bottom, 80)
    }
}

