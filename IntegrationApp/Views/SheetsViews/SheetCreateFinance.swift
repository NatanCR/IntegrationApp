//
//  SheetCreateFinance.swift
//  IntegrationApp
//
//  Created by Natan de Camargo Rodrigues on 23/11/23.
//

import SwiftUI

struct SheetCreateFinance: View {
    @Environment (\.screenSize) var screenSize
    @Environment(\.dismiss) var dismiss
    
    @State private var inputTitle: String = ""
    @State private var selectedDate = Date()
    @State private var inputTotalValue: Double = 0.0
    @State private var valuePerMemberCalculated: Double = 0.0
    @State private var totalCollaborators: Double = 0.0
    
    @ObservedObject var objectVM: APIRequestVM
    
    var body: some View {
        NavigationStack {
            VStack {
                Color.primaryBlue
                    .frame(height: 50)
                    .ignoresSafeArea()
                
                VStack(alignment: .leading) {
                    Section {
                        TextFieldComponent(valueText: $inputTitle, placeholder: "Digite o nome do débito...")
                    } header: {
                        Text("Título").bold().foregroundStyle(Color.black)
                    }
                    
                    Section {
                        DatePickerComponent(selectedDate: $selectedDate)
                    } header: {
                        Text("Data do Evento").bold().foregroundStyle(Color.black)
                    }
                    
                    Section {
                        NumberFieldComponent(totalValue: $inputTotalValue)
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
                                Text("\(valuePerMemberCalculated, specifier: "%.2f")")
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
            .onChange(of: inputTotalValue) { newValue in
                self.valuePerMemberCalculated = DataProcessor.shared.valuePerMemberCalculate(members: totalCollaborators, financeValue: inputTotalValue)                
            }
            
            .onAppear {
                self.totalCollaborators = DataProcessor.shared.calculateMembersCollaborators(members: self.objectVM.currentEvent.currentEvent?.financeValidation?.collaborators ?? [])
            }
            
            .onDisappear {
                Task {
//                    await objectVM.fetchAllEventsTableData()
                    await objectVM.fetchCurrentEventData()
                }
            }
            
            Spacer()
            .navigationBarTitle("Criar Débito", displayMode: .inline)
            .navigationBarItems(
                leading: Button("Cancelar") {
                    dismiss()
                },
                trailing: Button("Criar") {
                    //chamar função de salvar novo financeiro
                    let newFinance = Finance(id: inputTitle, title: inputTitle, deadline: Formatters.shared.dateToString(chosenDate: selectedDate), totalValue: inputTotalValue, valuePerMembers: valuePerMemberCalculated, valuePayed: 0.0, whoPayed: [])
                    objectVM.createFinance(newFinance: newFinance)
                    dismiss()
                }.bold()
            )
        }
    }
}

//#Preview {
//    SheetCreateFinance()
//}
