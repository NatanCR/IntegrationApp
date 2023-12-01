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
    @State private var navigationToEvent: Bool = false
    @State var tutorialState: TutorialState = .event
    
    @ObservedObject var objectVM: APIRequestVM
    
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
                Spacer()
            }
            .navigationBarTitle(sheetBarTitle, displayMode: .inline)
            .navigationBarItems(
                leading: Button("Cancelar") {
                    dismiss()
                },
                trailing: Button("Criar") {
                    //chamar função de salvar novo evento
                    let newEvent = Event(id: inputTitle, eventName: inputTitle, eventDate: Formatters.shared.dateToString(chosenDate: selectedDate), activeEvent: true, financeValidation: FinanceAnswer(id: "financeQuestion", title: "Você irá participar financeiramente do integration?"))
                    objectVM.currentEvent.currentEvent = newEvent
//                    objectVM.updateEvent(eventData: newEvent)
                    navigationToEvent = true
//                    dismiss()
                }.bold()
            )
            .background(
                NavigationLink(destination: EventView(tutorialState: $tutorialState, objectVM: objectVM), isActive: $navigationToEvent, label: { EmptyView() }).hidden()
            )
            
        }
        
    }
}
