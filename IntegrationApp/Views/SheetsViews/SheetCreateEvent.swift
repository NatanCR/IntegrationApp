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
    @State var tutorialState: TutorialState = .event
    
    @ObservedObject var objectVM: APIRequestVM
    let member = Member(id: "Joao", name: "Joao", financeMember: true, icon: "😁")
    let member3 = Member(id: "Gui", name: "Gui", financeMember: true, icon: "😜")
    let member2 = Member(id: "Natan", name: "Natan", financeMember: true, icon: "🤩")
    
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
            .onDisappear {
                Task {
                    await objectVM.fetchAllEventsTableData()
                    await objectVM.fetchCurrentEventData()
                }
            }
            .navigationBarTitle(sheetBarTitle, displayMode: .inline)
            .navigationBarItems(
                leading: Button("Cancelar") {
                    dismiss()
                },
                trailing: Button("Criar") {
                    //chamar função de salvar novo evento
                    let newEvent = Event(id: inputTitle,eventName: inputTitle, eventDate: Formatters.shared.dateToString(chosenDate: selectedDate), eventMembers: [member, member2, member3], quiz: [], finance: [], activeEvent: true, task: [], financeValidation: FinanceAnswer(id: "financeQuestion",title: "Você irá participar financeiramente do integration?", collaborators: [member, member3, member2]))
                    objectVM.updateEvent(eventData: newEvent)
                    dismiss()
                }.bold()
            )
        }
    }
}
