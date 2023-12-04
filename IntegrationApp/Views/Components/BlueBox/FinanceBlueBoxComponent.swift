//
//  FinanceBlueBoxComponent.swift
//  IntegrationApp
//
//  Created by Natan de Camargo Rodrigues on 27/11/23.
//

import SwiftUI

struct FinanceBlueBoxComponent: View {
    let financeCardTitle: String
    let deadlineCard: String
    let memberValue: Double
    @State var valuePayed: Double
    let totalValue: Double
    @Environment (\.screenSize) var screenSize
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(
                    Color(.financeBlueBox))
                .frame(width: 350, height: 150)
                .clipShape(RoundedRectangle(cornerRadius: 15))
            Divider()
                .frame(height: 1)
                .overlay(.white)
                .padding(.horizontal, 21)
            VStack {
                HStack {
                    Rectangle()
                        .fill(Color(.financeBlueBoxButton))
                        .frame(width: 40,height: 40)
                        .clipShape(RoundedRectangle(cornerRadius: 5))
                        .overlay {
                            Image(systemName: "dollarsign.circle.fill")
                                .foregroundStyle(Color.white)
                                .font(.title2)
                        }
                    VStack(alignment: .leading) {
                        Text(financeCardTitle)
                            .font(.custom("Poppins-SemiBold", size: 15))
                        Text("Valor por Membro:")
                            .font(.custom("Poppins-Regular", size: 12))
                    }
                    Spacer()
                    VStack(alignment: .trailing) {
                        Text("Validade: \(deadlineCard)")
                            .font(.custom("Poppins-SemiBold", size: 12))
                        Text("R$ \(memberValue, specifier: "%.2f")")
                            .font(.custom("Poppins-Regular", size: 12))
                    }
                }
                .padding(.horizontal, 30)
                .padding(.top, 15)
                HStack {
                    VStack {
                        Text("Valor pago: \(valuePayed, specifier: "%.2f")")
                            .font(.custom("Poppins-Regular", size: 12))
                    }
                    Spacer()
                    VStack {
                        Text("Valor total: R$ \(totalValue, specifier: "%.2f")")
                            .font(.custom("Poppins-Regular", size: 12))
                    }
                }
                .padding(.top, 20)
                .padding(.horizontal, 30)
                .font(.system(size: 13,
                               weight: .light,
                               design: .rounded))
                ActionBlueBoxButtonComponent(buttonTitle: "Definir como pago")
            }
        }
    }
}

#Preview {
    FinanceBlueBoxComponent(financeCardTitle: "Salgado", deadlineCard: "28/10", memberValue: 25.00, valuePayed: 50.00, totalValue: 250.00)
}
