//
//  HomeView.swift
//  IntegrationApp
//
//  Created by rebeca primo on 06/11/23.
//

import SwiftUI

struct HomeView: View {
    @Environment (\.screenSize) var screenSize
    @StateObject var objectVM = ObjectViewModel()
    
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
            
            .navigationTitle("Integration App")
            .toolbar {
                MemberButton(view: AnyView(MembersView()))
            }
            .ignoresSafeArea()
        }
    }
    
    /**Função para receber os dados do JSON e retornar de acordo com o tipo do modelo que vier**/
    func getData<T: Codable>(URLEndpoint: String, type: T) -> T? {
        objectVM.dataAPIResponse.fetchData(from: URLEndpoint, responseType: type as! T.Type)
        
        switch objectVM.dataAPIResponse.apiResponse {
        case .allEvents(let allEvents):
            return allEvents as? T
        case .currentEvent(let event):
            return event as? T
        case .none:
            return nil
        }
    }
}


#Preview {
    HomeView()
}
