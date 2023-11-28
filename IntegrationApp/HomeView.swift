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

                let newEvent = Event(eventName: "Integration Dezembro", eventDate: "27/09/2023", eventMembers: nil, quiz: nil, finance: nil, activeEvent: true, task: nil, financeValidation: FinanceAnswer(title: "Vai participar hoje?", collaborators: nil))
//
                let allEvents = AllEvents(id: "AllEvents", currentEvent: nil, previousEvent: [], wallet: Wallet(id: "Wallet", value: 0.0), users: [])
                
                let newUser = Login(id: "Natan", name: "Natan", email: "natancr@gmail.com", password: "12345")
                
//                objectVM.updateEvent(eventData: newEvent)
//                objectVM.createAllEventsTable(allEvents: allEvents)
//                objectVM.createUserTable()
//                objectVM.addNewUserToUserTable(newUser: newUser)
//                objectVM.updateWalletValue(wallet: Wallet(id: "Wallet", value: 2.0))
                objectVM.addEventMember(newMember: Member(id: "Natan", name: "Natan", financeMember: true))
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
