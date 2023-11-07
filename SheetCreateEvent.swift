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
                Section(header: Text("Título").bold().foregroundColor(.black).position(x:5)) {
                    TextFieldComponent(text: $title, placeholder: "Digite o nome do evento...")
                }
                Section(header: Text("Prazo Final").bold().foregroundColor(.black).position(x:25)) {
                    HStack {
                        DatePickerComponent(selectedDate: $selectedDate)
                        Spacer(minLength: 220)
                    }
                }
                Section(header: Text("Ícone").bold().foregroundColor(.black)) {
                    LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 4), spacing: 10) {
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
            .navigationBarTitle("Criar Evento", displayMode: .inline)
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
