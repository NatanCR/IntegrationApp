//
//  SheetCreateFinance.swift
//  IntegrationApp
//
//  Created by Natan de Camargo Rodrigues on 23/11/23.
//

import SwiftUI

struct SheetCreateFinance: View {
    @State var inputTotalValue: Double = 0.0
    @State var valuePerMemberCalculated: Double = 0.0
    @Environment (\.screenSize) var screenSize
    
    var body: some View {
        NavigationStack {
                SheetCreateEvent(placeholderText: "Digite o nome do débito...", sheetBarTitle: "Criar Débito", isFinanceSheetView: true)
            
            VStack(alignment: .leading) {
                Section {
                    NumberFieldComponent(totalValue: $inputTotalValue)
                        .onChange(of: inputTotalValue) { newValue in
                            //chama a função para atualizar o valor por membro
                        }
                } header: {
                    Text("Valor Total").bold().foregroundStyle(Color.black)
                }
                
                Section {
                    VStack(alignment: .leading) {
                        if valuePerMemberCalculated == 0.0 {
                            Text("R$ 00,00")
                                .padding(.horizontal, 8)
                                .frame(width: screenSize.width * 0.9, height: screenSize.height * 0.07, alignment: .leading)
                                .background(Color.primaryBlue)
                                .cornerRadius(15)
                                .foregroundColor(Color("TextFieldColor"))
                        } else {
                            Text("\(valuePerMemberCalculated)")
                                .padding(.horizontal, 8)
                                .frame(width: screenSize.width * 0.9, height: screenSize.height * 0.07)
                                .background(Color.primaryBlue)
                                .cornerRadius(15)
                                .foregroundColor(Color("TextFieldColor"))
                        }
                        
                    }
                } header: {
                    Text("Valor por Membro").bold().foregroundStyle(Color.black)
                }
            }
            Spacer()
        }
    }
}

#Preview {
    SheetCreateFinance()
}
