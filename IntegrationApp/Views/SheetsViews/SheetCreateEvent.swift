//
//  SheetCreateEvent.swift
//  IntegrationApp
//
//  Created by Guilherme Borges on 06/11/23.
//

import SwiftUI

struct SheetCreateEvent: View {
    @Environment(\.dismiss) var dismiss
    @Environment (\.screenSize) var screenSize
    var closeAndDisplayEventView: () -> Void
    
    @State var inputTitle: String = ""
    @State var selectedDate = Date()
    @State var inputTotalValue: Double = 0.0
    @State var valuePerMemberCalculated: Double = 0.0
    let placeholderText: String
    let sheetBarTitle: String
    
    var isFinanceSheetView: Bool
    
    var body: some View {
        NavigationStack {
            VStack {
                Color.primaryBlue
                    .frame(height: 50)
                    .ignoresSafeArea()
                
                    VStack(alignment: .leading) {
                        Section(header: Text("Título").bold().foregroundStyle(Color.black)){
                            TextFieldComponent(valueText: $inputTitle, placeholder: placeholderText)
                        }
                        
                        Section(header: Text("Data do Evento").bold().foregroundStyle(Color.black)) {
                            DatePickerComponent(selectedDate: $selectedDate)
                        }
                        
                        if isFinanceSheetView {
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
                    }
                Spacer()
                }
            
//                .scrollContentBackground(.hidden)
                .navigationBarTitle(sheetBarTitle, displayMode: .inline)
                .toolbarBackground(Color.primaryBlue, for: .navigationBar)
                .navigationBarItems(
                    leading: Button("Cancelar") {
                        dismiss()
                    },
                    trailing: Button("Criar") {
                        //chamar função de salvar novo evento
                        dismiss()
                    }.bold()
                    
                )
            }
            
    }
}
