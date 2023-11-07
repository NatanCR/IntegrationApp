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
    @State private var icons: [String] = ["icon1", "icon2", "icon3"]
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: TitleComponent(title: "Título").bold().foregroundColor(.black)) {
                    TextFieldComponent(text: $title, placeholder: "Digite o nome do evento...")
                }
                Section(header: TitleComponent(title: "Prazo Final").bold().foregroundColor(.black)) {
                    HStack {
                        DatePickerComponent(selectedDate: $selectedDate)
                        Spacer(minLength:220)
                    }
                    
                }
                Section(header: TitleComponent(title: "ícone").bold().foregroundColor(.black)) {
                    HStack(spacing:10) {
                        ForEach(icons, id: \.self) { iconName in
                            IconComponent(imageName: "img1")
                        }
                        AddIconComponent(addIconAction: {
                
                            icons.append("newIcon")
                        })
                    }
                }
                .listRowBackground(Color.clear)
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
