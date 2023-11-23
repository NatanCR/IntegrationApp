//
//  SheetCreateEvent.swift
//  IntegrationApp
//
//  Created by Guilherme Borges on 06/11/23.
//

import SwiftUI

struct SheetCreateEvent: View {
    var closeAndDisplayEventView: () -> Void
    @State var title: String = ""
    @State var selectedDate = Date()
    @Environment(\.dismiss) var dismiss
    @Environment (\.screenSize) var screenSize
    

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Título").bold().foregroundColor(.black)){
                    TextFieldComponent(text: $title, placeholder: "Digite o nome do evento...")
                }
                
                Section(header: Text("Data do Evento").bold().foregroundColor(.black)) {
                    DatePickerComponent(selectedDate: $selectedDate)
                }
                .listRowBackground(Color.clear)
            }
            .scrollContentBackground(.hidden)
            .navigationBarTitle("Criar Evento", displayMode: .inline)
            .toolbarBackground(Color.primaryBlue, for: .navigationBar)
            
            .navigationBarItems(
                leading: Button("Cancelar") {
                    dismiss()
                },
                trailing: Button("Criar") {
                    //chamar função de salvar novo evento
                    dismiss()
                }
            )
        }
        
    }
}
