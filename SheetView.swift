//
//  SheetView.swift
//  IntegrationApp
//
//  Created by Guilherme Borges on 06/11/23.
//

import SwiftUI

struct SheetView: View {
    @Binding var title: String
    @Binding var selectedDate: Date
    @Binding var isSheetPresented: Bool

    var body: some View {
        NavigationView {
            Form {
                Section(header: TitleComponent(title:"Título").bold().foregroundColor(.black)) {
                    TextFieldComponent(text: $title, placeholder: "Digite o nome do evento...")
    
                }
                Section(header: TitleComponent(title:"Data do evento").bold().foregroundColor(.black)) {
                    DatePickerComponent(selectedDate: $selectedDate)
                }
                Section(header: TitleComponent(title: "ícone").bold().foregroundColor(.black)) {
                    
                }
            }
            .navigationTitle("Criar Evento")
            .navigationBarItems(
                leading: Button("Cancelar") {
                    isSheetPresented = false
                },
                trailing: Button("Criar") {
                    isSheetPresented = false
                }
            )
        }
    }
}


//#Preview {
//    SheetView(title: <#Binding<String>#>, selectedDate: <#Binding<Date>#>, isSheetPresented: <#Binding<Bool>#>)
//}
