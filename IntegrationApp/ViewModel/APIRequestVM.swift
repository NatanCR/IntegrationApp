//
//  APIRequestVM.swift
//  IntegrationApp
//
//  Created by Natan de Camargo Rodrigues on 27/11/23.
//

import Foundation

class APIRequestVM: ObservableObject {
    @Published var allEvents: EventsTable?
    @Published var currentEvent: CurrentEvent?
    
    func fetchAllEventsTableData() {
        // Substitua a URL abaixo pela URL da sua API
        guard let url = URL(string: "http://127.0.0.1:5000/get_all_events") else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Erro na solicitação: \(error)")
                return
            }
            
            if let data = data {
                print(String(data: data, encoding: .utf8) ?? "Dados não válidos")
                
                do {
                    let decodedData = try JSONDecoder().decode(EventsTable.self, from: data)
                    DispatchQueue.main.async {
                        self.allEvents = decodedData
                    }
                } catch {
                    print("Erro ao decodificar JSON: \(error)")
                }
            }
        }.resume()
    }
    
    
    func fetchCurrentEventData() {
        // Substitua a URL abaixo pela URL da sua API
        guard let url = URL(string: "http://127.0.0.1:5000/get_current_event") else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                do {
                    let decodedData = try JSONDecoder().decode(CurrentEvent.self, from: data)
                    DispatchQueue.main.async {
                        self.currentEvent = decodedData
                    }
                } catch {
                    print("Erro ao decodificar JSON: \(error)")
                }
            }
        }.resume()
    }
    
    func updateEvent(eventData: Event) {
            guard let url = URL(string: "http://127.0.0.1:5000/update_current_event") else {
                return
            }

            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")

            do {
                let jsonData = try JSONEncoder().encode(eventData)
                request.httpBody = jsonData
            } catch {
                print("Erro ao codificar dados para JSON: \(error)")
                return
            }

            URLSession.shared.dataTask(with: request) { data, response, error in
                if let error = error {
                    print("Erro na solicitação: \(error)")
                    return
                }

                if let data = data {
                    // Processar a resposta, se necessário
                    print("Resposta da API: \(String(data: data, encoding: .utf8) ?? "Dados não válidos")")
                }
            }.resume()
        }
    
    func createAllEventsTable(allEvents: AllEvents) {
            guard let url = URL(string: "http://127.0.0.1:5000/create_all_events_table") else {
                return
            }

            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")

            do {
                let jsonData = try JSONEncoder().encode(allEvents)
                request.httpBody = jsonData
            } catch {
                print("Erro ao codificar dados para JSON: \(error)")
                return
            }

            URLSession.shared.dataTask(with: request) { data, response, error in
                if let error = error {
                    print("Erro na solicitação: \(error)")
                    return
                }

                if let data = data {
                    // Processar a resposta, se necessário
                    print("Resposta da API: \(String(data: data, encoding: .utf8) ?? "Dados não válidos")")
                }
            }.resume()
        }
}
