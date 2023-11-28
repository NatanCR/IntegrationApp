//
//  APIRequestVM.swift
//  IntegrationApp
//
//  Created by Natan de Camargo Rodrigues on 27/11/23.
//

import Foundation

enum APIResponseType {
    case allEvents(AllEvents)
    case currentEvent(Event)
}

class APIRequestVM: ObservableObject {
    @Published var apiResponse: APIResponseType?

    func fetchData<T: Codable>(from endpoint: String, responseType: T.Type) {
        guard let url = URL(string: "https://api.example.com/\(endpoint)") else {
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                do {
                    let decodedData = try JSONDecoder().decode(responseType, from: data)
                    DispatchQueue.main.async {
                        // Use o enum para mapear os diferentes tipos de modelos
                        self.apiResponse = self.mapToAPIResponseType(decodedData)
                    }
                } catch {
                    print("Erro ao decodificar JSON: \(error)")
                }
            }
        }.resume()
    }

    /**A função mapToAPIResponseType serve para mapear os dados decodificados de volta para o enum APIResponseType. Essa função recebe um objeto genérico T que deve ser Codable (ou seja, pode ser decodificado a partir de dados JSON), e ela tenta converter esse objeto para os tipos específicos que são esperados **/
    private func mapToAPIResponseType<T: Codable>(_ data: T) -> APIResponseType? {
        if let myData = data as? AllEvents {
            return .allEvents(myData)
        } else if let anotherData = data as? Event {
            return .currentEvent(anotherData)
        } else {
            return nil
        }
    }
    
}
