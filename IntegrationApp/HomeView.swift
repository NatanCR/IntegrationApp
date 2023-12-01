//
//  HomeView.swift
//  IntegrationApp
//
//  Created by rebeca primo on 06/11/23.
//

import SwiftUI

struct HomeView: View {
    @Environment(\.screenSize) var screenSize
    @State private var events: [AllEvents] = []

    var body: some View {
        NavigationStack {
            ZStack {
                Color.blueBg
                VStack {
                    Header()
                    
                    List(events, id: \.id) { event in
                        EventComponent()
                        //Text(event.currentEvent?.eventName ?? "")
                    }
                    .onAppear {
                        fetchEvents()
                    }

                    CreateEventButton(view: SheetCreateEvent(placeholderText: "Digite o nome do evento...", sheetBarTitle: "Criar Evento", isFinanceSheetView: false))
                        .position(CGPoint(x: screenSize.width * 0.90, y: screenSize.height * 0.45))
                }
                .navigationTitle("Integration")
                .toolbar {
                    MemberButton(view: AnyView(MembersView()))
                }
            }
            .ignoresSafeArea()
        }
    }

    // Função para buscar eventos da API
    func fetchEvents() {
        guard let url = URL(string: "https://python-api-henna-pi.vercel.app/get_all_events") else {
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                do {
                    let decodedEvents = try JSONDecoder().decode([AllEvents].self, from: data)
                    DispatchQueue.main.async {
                        self.events = decodedEvents
                    }
                } catch {
                    print("Erro ao decodificar dados: \(error)")
                }
            }
        }.resume()
    }
}

#Preview { HomeView() }

