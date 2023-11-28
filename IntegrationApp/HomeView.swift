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
                objectVM.fetchAllEventsTableData()

                let newEvent = Event(eventName: "Integration Dezembro", eventDate: "27/09/2023", eventMembers: [Member(name: "Gui", financeMember: true)], quiz: [Quiz(title: "Votação salgado", category: .finance, answerType: .unique, answerOptions: [QuizAnswer(title: "Coca-Cola", votes: 9)], icon: "plus")], finance: Finance(title: "Compra salgados", deadline: "29/09/2023", totalValue: 230.00, valueMembers: 15), activeEvent: true, task: [EventTask(title: "Comprar salgado", deadline: "28/09/2023", collaborators: [Member(name: "Gui", financeMember: true)], status: .on, icon: "plus")], financeValidation: FinanceAnswer(title: "Vai participar hoje?", collaborators: [Member(name: "Gui", financeMember: true)]))
                
                let allEvents = AllEvents(id: "AllEvents", currentEvent: newEvent, previousEvent: [], wallet: Wallet(id: "Wallet", value: 0.0), users: [Login(id: "Natan", name: "Natan", email: "natancr@gmail.com", password: "12345")])
                
//                objectVM.updateEvent(eventData: newEvent)
//                objectVM.createAllEventsTable(allEvents: allEvents)
            }
            
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
