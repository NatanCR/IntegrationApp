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

   // número de colunas de LazyVGrid
    let gridColumns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Título").bold().foregroundColor(.black)) {
                    TextField("Digite o nome do evento...", text: $title)
                }
                Section(header: Text("Prazo Final").bold().foregroundColor(.black)) {
                    HStack {
                        DatePickerComponent(selectedDate: $selectedDate)
                        Spacer(minLength: 220)
                    }
                }
                Section(header: Text("Ícone").bold().foregroundColor(.black)) {
                    LazyVGrid(columns: gridColumns, spacing: 10) {
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
