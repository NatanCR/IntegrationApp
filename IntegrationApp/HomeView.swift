//
//  HomeView.swift
//  IntegrationApp
//
//  Created by rebeca primo on 06/11/23.
//

import SwiftUI

struct HomeView: View {
    //var event: [AllEvents]
    
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
                    
                    AddButton(view: AnyView(MembersView()))
                        .position(CGPoint(x: 350.0, y: 350.0))
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
