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
        VStack(alignment: .leading) {
            if objectVM.currentEvent.currentEvent?.finance?.count == 0 {
                VStack(alignment: .trailing) {
                    VStack(alignment: .center) {
                        Text("Nenhum débito foi criado...")
                            .font(.custom("Poppins-Regular", size: 15))
                            .foregroundStyle(Color.blueText)
                        Image(.imagemSimFinaceiro)
                            .resizable()
                            .scaledToFit()
                    }
                    
                }
            } else {
                VStack {
                    ForEach((objectVM.currentEvent.currentEvent?.finance) ?? [], id: \.self) { finance in
                        FinanceBlueBoxComponent(financeCardTitle: finance.title!, deadlineCard: finance.deadline!, memberValue: finance.valuePerMembers!, valuePayed: finance.valuePayed!, totalValue: finance.totalValue!)
                    }
                    Divider()
                    
                    GridMembersIconComponent(data: (objectVM.currentEvent.currentEvent?.financeValidation?.collaborators)!, rows: Properties.shared.gridRowsFinance, gridHeight: Properties.shared.gridHeightFinance)
                    
                    Divider()
                }
                .padding(.top, 50)
            }
            
            Spacer()
            HStack {
                WalletCardComponent(walletValue: currentWalletValue)
                    .padding(.leading,10)
                Spacer()
                if objectVM.currentEvent.currentEvent?.finance?.count == 0 {
                    CreateEventButton(view: SheetCreateFinance(objectVM: objectVM))
                        .padding(.trailing, 10)
                }
            }
        }
    }
}

#Preview {
    FinanceSubview(currentWalletValue: 0.00, objectVM: APIRequestVM())
}
