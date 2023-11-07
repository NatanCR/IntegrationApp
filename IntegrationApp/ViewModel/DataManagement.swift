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
    
    //MARK: - TABLE ID
    func saveTableID(tableID: String) {
        UserDefaults.standard.set(tableID, forKey: "tableID")
    }
    
    func getTableID() -> String? {
        if let tableId = UserDefaults.standard.string(forKey: "tableID") {
            print("Got the table id: \(tableId)")
            return tableId
        } else {
            print("Could not get the table id")
            return nil
        }
    }
    
    //MARK: - CREATING USER
    func saveLocalUser(user: Member) {
        UserDefaults.standard.set(user, forKey: "user")
    }
    
    func getLocalUser() -> Member {
        return UserDefaults.standard.object(forKey: "user") as! Member
    }
    
    //MARK: - CREATING DATA
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
    /**Função para criar um novo evento na tabela do dynamo**/
    func createNewEvent(eventName: String) async {
        do {
            //cria um novo evento
            let newEvent = Event(eventName: eventName, eventDate: Formatters.shared.currentDateToString())
            //recebe os dados do banco
            var eventsData = await getDynamoTable()
            //recebe o novo evento na variavel
            eventsData?.currentEvent = newEvent
            //tratamento se existe dados
            if let savedEventsData = eventsData {
                //salva a nova tabela de dados
                try await Amplify.DataStore.save(savedEventsData)
                print("Saved event: \(savedEventsData.currentEvent?.eventName)")
            } else {
                print("Could not save the instance of AllEvents")
            }
        } catch {
            print("Could not query DataStore: \(error)")
        }
    }
    
    //MARK: - GETTING DATA
    /**Função para pegar a tabela de AllEvents do dynamo**/
    func getDynamoTable() async -> AllEvents? {
        do {
            
            guard let tableId = AppObjects.shared.tableID else { print("Could not get the id"); return nil}
            //requisita a tabela do banco e faz o tratamento se veio vazia
            if let allEvents = try await Amplify.DataStore.query(AllEvents.self, byId: tableId) {
                print("Got allEvents table: \(allEvents.id)")
                //retorna a tabela de dados
                return allEvents
            } else {
                print("Could not get the instance of AllEvents")
                return nil
            }
            
        } catch {
            print("Could not query DataStore: \(error)")
            return nil
        }
    }
    
    /**Função para pegar a estrutura do evento atual*/
    func getCurrentEvent() async -> Event? {
        do {
            //trata o recebimento dos dados para saber se esta vazio
            if let currentEvent = await getDynamoTable()?.currentEvent {
                print("Got the current event: \(currentEvent.eventName)")
                //retorna o evento atual
                return currentEvent
            } else {
                print("Could not get the current event in instance of AllEvents")
                return nil
            }
        } catch {
            print("Could not query DataStore: \(error)")
            return nil
        }
    }
    
    //MARK: - SETTING DATA
    /**Função para colocar o evento atual na lista de eventos passados e passar valor nulo ao evento atual**/
    func setNewPreviousEvent(currentEvent: Event) async {
        do {
            //trata o recebimento dos dados da tabela do banco
            guard var tableData = await getDynamoTable() else { print("Could not get the dynamo table"); return }
            //adiciona o evento atual na lista de passados
            tableData.previousEvent?.append(currentEvent)
            //evento atual passa a ser nulo
            tableData.currentEvent = nil
            //salva a nova tabela de dados
            try await Amplify.DataStore.save(tableData)
        } catch {
            print("Could not query DataStore: \(error)")
        }
    }
    
    //MARK: - UPDATING DATA
    /**Função para atualizar o nome do evento atual no banco e no objeto local.**/
    func updateEvent(event newEventValue: Event) async {
        do {
            //carrega a tabela
            if var allEvents = await getDynamoTable() {
                //atualiza o valor do evento atual da tabela
                allEvents.currentEvent = newEventValue
                //salva a tabela com o novo evento
                try await Amplify.DataStore.save(allEvents)
            } else {
                print("Could not update the event: \(newEventValue.eventName)")
            }
        } catch {
            print("Could not query DataStore: \(error)")
        }
    }
    
    //MARK: - DELETING DATA
    /**Função para colocar o evento atual como nulo**/
    func deleteCurrentEvent() async {
        do {
            //trata o recebimento da tabela
            if var table = await getDynamoTable() {
                print("Deleting event: \(table.currentEvent?.eventName)")
                //evento atual da tabela recebe valor nulo
                table.currentEvent = nil
                //salva a tabela com o evento atual nulo
                try await Amplify.DataStore.save(table)
            } else {
                print("Could not get the dybamo table")
            }
        } catch {
            print("Could not query DataStore: \(error)")
        }
    }
}

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
