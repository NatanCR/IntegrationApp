//
//  WalletCardComponent.swift
//  IntegrationApp
//
//  Created by Natan de Camargo Rodrigues on 27/11/23.
//

import SwiftUI

struct WalletCardComponent: View {
    @State var walletValue: Double
    
    var body: some View {
        ZStack(alignment: .leading) {
            Rectangle()
                .fill(Color(.financeBlueBoxButton))
                .frame(width: 125, height: 50)
                .clipShape(RoundedRectangle(cornerRadius: 15))
            Text("R$ \(walletValue, specifier: "%.2f")")
                .foregroundStyle(Color.white)
                .font(.custom("Poppins-Regular", size: 14))
//                .font(.system(size: 14, weight: .semibold, design: .rounded))
                .padding()
            
        }
    }
}

#Preview {
    WalletCardComponent(walletValue: 00.00)
}
