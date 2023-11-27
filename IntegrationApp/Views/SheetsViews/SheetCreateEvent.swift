//
//  SheetCreateEvent.swift
//  IntegrationApp
//
//  Created by Guilherme Borges on 06/11/23.
//

import SwiftUI

struct SheetCreateEvent: View {
    @Binding var title: String
    @Binding var selectedDate: Date
    @Binding var isSheetPresented: Bool
    @State private var icons: [String] = ["volleyball.fill","balloon.2.fill","cup.and.saucer.fill","plus"]
    @Environment (\.screenSize) var screenSize
    @State private var newOption = ""

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Título").bold().foregroundColor(.black)){
                    TextFieldComponent(text: $title, placeholder: "Digite o nome do evento...")
                        .foregroundColor(Color("TextFieldColor"))
                }
                
                Section(header: Text("Data do Evento").bold().foregroundColor(.black)) {
                    
                    ZStack(alignment: .leading) {
                        RoundedRectangle(cornerRadius: 15)
                            .fill(Color.primaryBlue)
                            .frame(width: screenSize.width * 0.9, height: screenSize.height * 0.07)
                        HStack {
                            DatePickerComponent(selectedDate: $selectedDate)
                        }.padding(.horizontal, 10)
                    }
                }
                
                Section(header: Text("Ícone").bold().foregroundColor(.black)) {
                    
                    LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 4), spacing: 10) {
                        
                        ForEach(icons, id: \.self) { iconName in
                            IconComponent(iconName: iconName)
                        }
                    }
                }
                .listRowBackground(Color.clear)

            }
            .scrollContentBackground(.hidden)
            .navigationBarTitle("Criar Evento", displayMode: .inline)
            .toolbarBackground(Color.primaryBlue, for: .navigationBar)
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
