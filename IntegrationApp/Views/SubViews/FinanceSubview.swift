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
            VStack(alignment: .leading) {
                
                
                if objectVM.currentEvent.currentEvent?.finance == nil {
                    VStack {
                        Text("Nenhum débito foi criado...")
                            .font(.custom("Poppins-Regular", size: 15))
                            .foregroundStyle(Color.blueText)
                        Image(.imagemSimFinaceiro)
                            .resizable()
                            .scaledToFit()
                        
                        CreateEventButton(view: SheetCreateFinance(objectVM: objectVM))
                            .position(CGPoint(x: screenSize.width * 0.88, y: screenSize.height * 0.78))
                    }
                } else {
                    VStack {
                        ForEach((objectVM.currentEvent.currentEvent?.finance)!, id: \.self) { finance in
                            FinanceBlueBoxComponent(financeCardTitle: finance.title!, deadlineCard: finance.deadline!, memberValue: finance.valuePerMembers!, valuePayed: finance.valuePayed!, totalValue: finance.totalValue!)
                        }
                        
                        Divider()
                        
                        GridMembersIconComponent(data: (objectVM.currentEvent.currentEvent?.financeValidation?.collaborators)!, rows: Properties.shared.gridRowsFinance, gridHeight: Properties.shared.gridHeightFinance)
                        
                        Divider()
                    }
                    
                }
                VStack {
                    WalletCardComponent(walletValue: currentWalletValue)
                        .padding(.horizontal,10)
                    //                .position(CGPoint(x: screenSize.width * 0.2, y: screenSize.height * 0.78))
                }
            }
        }
        .onAppear{
            print("FINANCE VIEW")
            dump(objectVM.currentEvent)
        }
    }
}

#Preview {
    FinanceSubview(currentWalletValue: 0.00, objectVM: APIRequestVM())
}
