//
//  FinanceSubview.swift
//  IntegrationApp
//
//  Created by Barbara Argolo on 07/11/23.
//

import SwiftUI

struct FinanceSubview: View {
    @Environment (\.screenSize) var screenSize
    @State var currentWalletValue: Double = 0.00
    
    @ObservedObject var objectVM: APIRequestVM
    
    var body: some View {
        ZStack {
            CreateEventButton(view: SheetCreateFinance(objectVM: objectVM))
                .position(CGPoint(x: screenSize.width * 0.88, y: screenSize.height * 0.78))
            
            WalletCardComponent(walletValue: currentWalletValue)
                .position(CGPoint(x: screenSize.width * 0.2, y: screenSize.height * 0.78))
        }
        .onAppear{
            //TODO: Função para: - carregar valor do caixa
            //                   - carregar financeiro em aberto
            
        }
    }
}

//#Preview {
//    FinanceSubview(currentWalletValue: 0.00)
//}
