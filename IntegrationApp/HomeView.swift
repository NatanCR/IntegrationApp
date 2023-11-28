//
//  HomeView.swift
//  IntegrationApp
//
//  Created by rebeca primo on 06/11/23.
//

import SwiftUI

struct HomeView: View {
    @Environment (\.screenSize) var screenSize
    @StateObject var objectVM = APIRequestVM()
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.blueBg
                VStack {
                    Header()
                    
                    Text("Nenhum evento criado...")
                        .foregroundColor(Color.blueText)
                    
                    CreateEventButton(view: SheetCreateEvent(placeholderText: "Digite o nome do evento...", sheetBarTitle: "Criar Evento", isFinanceSheetView: false))
                        .position(CGPoint(x: screenSize.width * 0.90, y: screenSize.height * 0.45))
                }
            }
            .onAppear {
//                objectVM.fetchAllEventsTableData()
//                objectVM.fetchCurrentEventData()

                let newEvent = Event(eventName: "Integration Dezembro", eventDate: "27/09/2023", eventMembers: [], quiz: [], finance: nil, activeEvent: true, task: [], financeValidation: FinanceAnswer(title: "Vai participar hoje?", collaborators: []))
//
                let allEvents = AllEvents(id: "AllEvents", currentEvent: nil, previousEvent: [], wallet: Wallet(id: "Wallet", value: 0.0), users: [])
                
                let newUser = Login(id: "Natan", name: "Natan", email: "natancr@gmail.com", password: "12345")
                
                let newQuiz = Quiz(id: "Salgados", title: "Salgados", category: .finance, answerType: .multiple, answerOptions: [QuizAnswer(id: "Coxinha", title: "Coxinha", votes: 0), QuizAnswer(id: "Queijo", title: "Queijo", votes: 0)], icon: "plus")
                
                let newTask = EventTask(id: "Comprar salgados", title: "Comprar Salgados", deadline: "26/09/2023", collaborators: [], status: .on, icon: "plus")
                
//                objectVM.updateEvent(eventData: newEvent)
//                objectVM.createAllEventsTable(allEvents: allEvents)
//                objectVM.createUserTable()
//                objectVM.addNewUserToUserTable(newUser: newUser)
//                objectVM.updateWalletValue(wallet: Wallet(id: "Wallet", value: 2.0))
//                objectVM.addEventMember(newMember: Member(id: "Joao", name: "Joao", financeMember: true))
//                objectVM.createQuiz(newQuiz: newQuiz)
                objectVM.createTask(newTask: newTask)
            }
            
//            .onReceive(objectVM.$currentEvent, perform: { update in
//                print("/////////////////")
//                print(update)
//            })
            .navigationTitle("Integration App")
            .toolbar {
                MemberButton(view: AnyView(MembersView()))
            }
            .ignoresSafeArea()
        }
    }
}


#Preview {
    HomeView()
}
