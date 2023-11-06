//
//  DataManagement.swift
//  IntegrationApp
//
//  Created by Natan de Camargo Rodrigues on 06/11/23.
//

import Foundation
import Amplify

class DataManagement {
    public static var shared = DataManagement()
    
    func saveTableID(tableID: String) {
        UserDefaults.standard.set(tableID, forKey: "tableID")
    }
    
    func getTableID() -> String {
        return UserDefaults.standard.string(forKey: "tableID") ?? ""
    }
    
    /**Função para criar um item do nosso modelo na tabela do dynamo (ainda sem nenhum evento dentro)**/
    func createEventTable() async {
        do {
            let newTable = AllEvents(wallet: Wallet(value: 0.0))
            saveTableID(tableID: newTable.id)
            
            let savedTable = try await Amplify.DataStore.save(newTable)
            
            print("Saved event table: \(savedTable.id)")
        } catch {
            print("Could not save event to DataStore: \(error)")
        }
    }
    
    func createNewEvent(eventName: String) async {
        do {
            let newEvent = Event(eventName: eventName, eventDate: Formatters.shared.currentDateToString())
            
            var eventsData = try await Amplify.DataStore.query(AllEvents.self, byId: AppObjects.shared.tableID)
            eventsData?.currentEvent = newEvent
            
            if let savedEventsData = eventsData {
                try await Amplify.DataStore.save(savedEventsData)
                print("Saved event: \(savedEventsData.currentEvent?.eventName)")
            } else {
                print("Could not save the instance of AllEvents")
            }
        } catch {
            print("Could not query DataStore: \(error)")
        }
    }
}


//    //MARK: - Criar evento
//    func createEvent() async {
//        do {
//            let event = Event(eventName: "Primeiro Integration", eventDate: Formatters.shared.currentDateToString(), eventMembers: [EventMember(name: "Natanzera"), EventMember(name: "Barbaresca")])
//
//            let savedEvent = try await Amplify.DataStore.save(event)
//            print("Saved event: \(savedEvent.eventName)")
//        } catch {
//            print("Could not save event to DataStore: \(error)")
//        }
//    }
//
//    //MARK: - Consulatar eventos
//    func getAllEvents() async {
//        do {
//            let events = try await Amplify.DataStore.query(Event.self)
//            for event in events {
//                print("==== Event ====")
//                print("Name: \(event.eventName)")
//                if let eventDate = event.eventDate {
//                    print("Event Date: \(eventDate)")
//                }
//                if let members = event.eventMembers {
//                    for i in members {
//                        print("Event members: \(i?.name ?? "Zé ninguém")")
//                    }
//                }
//            }
//        } catch {
//            print("Could not query DataStore: \(error)")
//        }
//    }
//
//    //MARK: - Atualizar evento
//    func updateEvent() async {
//        do {
//            //busca pelo mesmo nome/valor da propriedade
//            let events = try await Amplify.DataStore.query(Event.self,
//                                                           where: Event.keys.eventName.eq("Primeiro Integration"))
//            guard events.count == 1, var updatedEvent = events.first else {
//                print("Did not find exactly one event, bailing")
//                return
//            }
//            updatedEvent.eventName = "Último Integration"
//            let savedEvent = try await Amplify.DataStore.save(updatedEvent)
//            print("Updated event: \(savedEvent.eventName)")
//        } catch {
//            print("Unable to perform operation: \(error)")
//        }
//    }
//
//    //MARK: - Deletar evento
//    func deleteEvent() async {
//        do {
//            let event = try await Amplify.DataStore.query(Event.self,
//                                                          where: Event.keys.eventName.eq("Último Integration"))
//            guard event.count == 1, let toDeleteEvent = event.first else {
//                print("Did not find exactly one event, bailing")
//                return
//            }
//            try await Amplify.DataStore.delete(toDeleteEvent)
//            print("Deleted item: \(toDeleteEvent.eventName)")
//        } catch {
//            print("Unable to perform operation: \(error)")
//        }
//    }
