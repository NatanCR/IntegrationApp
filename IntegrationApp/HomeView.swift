//
//  HomeView.swift
//  IntegrationApp
//
//  Created by rebeca primo on 06/11/23.
//

import SwiftUI

struct HomeView: View {
    //var event: [AllEvents]
    @Environment (\.screenSize) var screenSize
    var body: some View {
        NavigationStack {
            ZStack {
                Color.blueBg
                VStack {
                    Header()
                
                    Text("Nenhum evento criado...")
                        .foregroundColor(Color.blueText)
//                    if event.isEmpty {
//                                Text("Nenhum evento criado...")
//                            } else {
//                                VStack {
//                    
//                                }
//                            }
                    
                    CreateEventButton(view: SheetCreateEvent(closeAndDisplayEventView: {}, placeholderText: "Digite o nome do evento...", sheetBarTitle: "Criar Evento", isFinanceSheetView: false))
                        .position(CGPoint(x: screenSize.width * 0.90, y: screenSize.height * 0.45))
                }
                .navigationTitle("Integration App")
                .toolbar {
                    MemberButton(view: AnyView(MembersView()))
                }
            }
            .ignoresSafeArea()
        }
    }
}


#Preview {
    HomeView()
}
