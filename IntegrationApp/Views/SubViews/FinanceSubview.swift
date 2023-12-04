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
            if objectVM.currentEvent.currentEvent?.finance == nil {
                VStack {
                    Text("Nenhum débito foi criado...")
                        .font(.custom("Poppins-Regular", size: 15))
                        .foregroundStyle(Color.blueText)
                    Image(.imagemSimFinaceiro)
                        .resizable()
                        .scaledToFit()
                        
                }
            } else {
                ForEach((objectVM.currentEvent.currentEvent?.finance)!, id: \.self) { finance in
                    FinanceBlueBoxComponent(financeCardTitle: finance.title!, deadlineCard: finance.deadline!, memberValue: finance.valuePerMembers!, valuePayed: finance.valuePayed!, totalValue: finance.totalValue!)
                }
            }
            CreateEventButton(view: SheetCreateFinance(objectVM: objectVM))
                .position(CGPoint(x: screenSize.width * 0.88, y: screenSize.height * 0.78))
            
            WalletCardComponent(walletValue: currentWalletValue)
                .position(CGPoint(x: screenSize.width * 0.2, y: screenSize.height * 0.78))
        }
        .onAppear{
            print("FINANCE VIEW")
            dump(objectVM.currentEvent)
            //TODO: Função para: - carregar valor do caixa
            //                   - carregar financeiro em aberto
        }
    }
}

#Preview {
    FinanceSubview(currentWalletValue: 0.00, objectVM: APIRequestVM())
}
