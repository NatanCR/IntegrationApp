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
    @State var showProgressLoading: Bool = true
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.blueBg
                VStack(alignment: .trailing) {
                    ScrollView {
                        Header()
                        if let allEvents = objectVM.allEventsTable.allEvents {
                            if objectVM.currentEvent.currentEvent != nil {
                                Section {
                                    ForEach(allEvents, id: \.self) { event in
                                        NavigationLink {
                                            EventView(objectVM: objectVM)
                                        } label: {
                                            EventComponent(eventTitle: event.currentEvent?.eventName ?? "Integration", eventDate: event.currentEvent?.eventDate ?? "", objectVM: objectVM)
                                        }
                                    }
                                    
                                } header: {
                                    Text("Evento em andamento")
                                        .frame(maxWidth:.infinity, alignment: .leading)
                                        .padding(.horizontal, 20)
                                        .font(.custom("Poppins-SemiBold", size: 15))
                                        .foregroundStyle(Color.textSection)
                                }
                                
                                Section {
                                    ForEach(allEvents, id: \.self) { event in
                                        ForEach(event.previousEvent!, id: \.self) { previous in
                                            EventComponent(eventTitle: previous?.eventName ?? "Integration", eventDate: previous?.eventDate ?? "", objectVM: objectVM)
                                        }
                                    }
                                } header: {
                                    Text("Eventos passados")
                                        .frame(maxWidth:.infinity, alignment: .leading)
                                        .padding(.horizontal, 20)
                                        .padding(.vertical, 40)
                                        .font(.custom("Poppins-SemiBold", size: 15))
                                        .foregroundStyle(Color.textSection)
                                }
                                
                            } else {
                                VStack(alignment: .center) {
                                    Text("Nenhum evento criado...")
                                        .font(.custom("Poppins-Regular", size: 15))
                                        .foregroundStyle(Color.blueText)
                                    Image(.imagemEventos)
                                        .resizable()
                                        .scaledToFit()
                                }                                
                            }
                        }
                    }
                    
                    CreateEventButton(view: SheetCreateEvent(placeholderText: "Digite o nome do evento...", sheetBarTitle: "Criar Evento", objectVM: objectVM))
                        .padding(.trailing, 10)
                }
                .task {
                    await objectVM.fetchAllEventsTableData()
                    await objectVM.fetchCurrentEventData()
                }
            }
            
            .onAppear {
                
                //                let newEvent = Event(id: "Integration Dezembro",eventName: "Integration Dezembro", eventDate: "11/12/2023", eventMembers: [], quiz: [], finance: [], activeEvent: true, task: [], financeValidation: FinanceAnswer(id: "financeQuestion",title: "Vai participar financeiramente?", collaborators: []))
                
                //                    let newCurrentEvent = CurrentEvent(currentEvent: newEvent)
                
                //                    let allEvents = AllEvents(id: "AllEvents", currentEvent: nil, previousEvent: [], wallet: Wallet(id: "Wallet", value: 0.0), users: [])
                //
                //                    let newUser = Login(id: "Natan", name: "Natan", email: "natancr@gmail.com", password: "12345")
                //
                //                    let newQuiz = Quiz(id: "Salgados", title: "Salgados", category: .finance, answerType: .multiple, answerOptions: [QuizAnswer(optionId: "Coxinha", title: "Coxinha", votes: 0), QuizAnswer(optionId: "Queijo", title: "Queijo", votes: 0)], icon: "plus")
                //
                //                    let quizAnswer = QuizAnswer(optionId: "Queijo", title: "Queijo", votes: 0)
                //
                //                    let newTask = EventTask(id: "Comprar salgados", title: "Comprar Salgados", deadline: "26/09/2023", collaborators: [], status: .on, icon: "plus")
                //
                //                                    let newFinance = Finance(id: "Compra geral", title: "Compra geral", deadline: "28/09/2023", totalValue: 230.00, valuePerMembers: 23.89, valuePayed: 150.00, whoPayed: [])
                //
                //                let member = Member(id: "Joao", name: "Joao", financeMember: true, icon: "😁")
                //
                //                    let newTaskMember = NewTaskMember(member: member, id: newTask.id)
                //
                //                    let addVote = AddQuizVote(id: newQuiz.id, optionId: quizAnswer.optionId)
                
                //                let newFinanceValidationMember = NewValidationMember(id: newEvent.financeValidation?.id, member: member)
                
                
                // objectVM.updateEvent(eventData: newEvent)
                //                objectVM.moveCurrentEventToPreviousEvent()
                //                                    objectVM.createAllEventsTable(allEvents: allEvents)
                //                objectVM.createUserTable()
                //                objectVM.addNewUserToUserTable(newUser: newUser)
                //                objectVM.updateWalletValue(wallet: Wallet(id: "Wallet", value: 2.0))
                //                                                objectVM.addEventMember(newMember: member)
                //                objectVM.createQuiz(newQuiz: newQuiz)
                //                objectVM.createTask(newTask: newTask)
                //                                    objectVM.createFinance(newFinance: newFinance)
                //                objectVM.addTaskMember(newMember: newTaskMember)
                //                objectVM.addQuizVote(quizForAdd: addVote)
                //                                                    objectVM.addMemberToFinanceValidation(newMember: newFinanceValidationMember)
            }
            .navigationTitle("Integration App")
            .toolbar {
                // MemberButton(view: AnyView(MembersView()))
            }
            .ignoresSafeArea()
        }
    }
}
