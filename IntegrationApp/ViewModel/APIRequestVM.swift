//
//  APIRequestVM.swift
//  IntegrationApp
//
//  Created by Natan de Camargo Rodrigues on 27/11/23.
//

import Foundation

class APIRequestVM: ObservableObject {
    static let shared = APIRequestVM()
    
    @Published var allEvents = EventsTable()
    @Published var currentEvent = CurrentEvent()
    
    //MARK: - READ
    /**Função para pegar os dados completos da tabela no banco**/
    func fetchAllEventsTableData() async {
        // Substitua a URL abaixo pela URL da sua API
        guard let url = URL(string: "https://python-api-henna-pi.vercel.app/get_all_events") else {
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
    
    /**Função para pegar os dados diretamente do evento atual*/
    func fetchCurrentEventData() async {
        // Substitua a URL abaixo pela URL da sua API
        guard let url = URL(string: "https://python-api-henna-pi.vercel.app/get_current_event") else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                print(String(data: data, encoding: .utf8) ?? "Dados não válidos")
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
    
    //MARK: - UPDATE
    /**Função para  atualizar diretamente os dados do evento atual**/
    func updateEvent(eventData: Event) {
            guard let url = URL(string: "https://python-api-henna-pi.vercel.app/update_current_event") else {
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
    
    /**Função para adicionar um novo usuário na tabela Users**/
    func addNewUserToUserTable(newUser: Login) {
        guard let url = URL(string: "https://python-api-henna-pi.vercel.app/create_user") else {
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        do {
            let jsonData = try JSONEncoder().encode(newUser)
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
    
    /**Função para atualizar o valor da wallet**/
    func updateWalletValue(wallet: Wallet) {
        guard let url = URL(string: "https://python-api-henna-pi.vercel.app/add_wallet_value") else {
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        do {
            let jsonData = try JSONEncoder().encode(wallet)
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
    
    /**Função para adicionar membro no evento**/
    func addEventMember(newMember: Member) {
        guard let url = URL(string: "https://python-api-henna-pi.vercel.app/add_event_member") else {
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        do {
            let jsonData = try JSONEncoder().encode(newMember)
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
    
    /**Função para adicionar um novo membro na task**/
    func addTaskMember(newMember: NewTaskMember) {
        let url = URL(string: "https://python-api-henna-pi.vercel.app/add_member_to_task")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        do {
            let jsonData = try JSONEncoder().encode(newMember)
            print(String(data: jsonData, encoding: .utf8) ?? "Dados não válidos")
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
    
    /**Função para incrementar um voto na resposta do quiz**/
    func addQuizVote(quizForAdd: AddQuizVote) {
        let url = URL(string: "https://python-api-henna-pi.vercel.app/increment_vote")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        do {
            let jsonData = try JSONEncoder().encode(quizForAdd)
            print(String(data: jsonData, encoding: .utf8) ?? "Dados não válidos")
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
    
    /**Função para adicionar um membro financeiramente participante**/
    func addMemberToFinanceValidation(newMember: NewValidationMember) {
        let url = URL(string: "https://python-api-henna-pi.vercel.app/add_member_to_finance_validation")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        do {
            let jsonData = try JSONEncoder().encode(newMember)
            print(String(data: jsonData, encoding: .utf8) ?? "Dados não válidos")
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
    
    //MARK: - CREATE
    /**Função para criar a tabela completa no banco**/
    func createAllEventsTable(allEvents: AllEvents) {
            guard let url = URL(string: "https://python-api-henna-pi.vercel.app/create_all_events_table") else {
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
    
    /**Função para criar a tabela de usuários vazia**/
    func createUserTable() {
        guard let url = URL(string: "https://python-api-henna-pi.vercel.app/create_user_table") else {
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
    
    /**Função para criar um novo quiz no evento**/
    func createQuiz(newQuiz: Quiz) {
        guard let url = URL(string: "https://python-api-henna-pi.vercel.app/create_quiz") else {
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        do {
            let jsonData = try JSONEncoder().encode(newQuiz)
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
    
    /**Função para criar uma nova task no evento**/
    func createTask(newTask: EventTask) {
        guard let url = URL(string: "https://python-api-henna-pi.vercel.app/create_task") else {
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        do {
            let jsonData = try JSONEncoder().encode(newTask)
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
    
    /**Função para criar um resgistro financeiro no evento**/
    func createFinance(newFinance: Finance) {
        guard let url = URL(string: "https://python-api-henna-pi.vercel.app/create_finance") else {
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        do {
            let jsonData = try JSONEncoder().encode(newFinance)
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
