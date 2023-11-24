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
    
    @State var inputTitle: String = ""
    @State var selectedDate = Date()
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
                        Section {
                            TextFieldComponent(valueText: $inputTitle, placeholder: placeholderText)
                        } header: {
                            Text("Título").bold().foregroundStyle(Color.black)
                        }
                        
                        Section {
                            DatePickerComponent(selectedDate: $selectedDate)
                        } header: {
                            Text("Data do Evento").bold().foregroundStyle(Color.black)
                        }
                    }
                }
                .navigationBarTitle(sheetBarTitle, displayMode: .inline)
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
