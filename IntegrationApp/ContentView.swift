//
//  ContentView.swift
//  IntegrationApp
//
//  Created by Natan de Camargo Rodrigues on 28/10/23.
//

import SwiftUI

struct ContentView: View {
    @State private var tutorialState: TutorialState = .introduction
    @State private var title = ""
    
    var body: some View {
        ZStack {
            if tutorialState == .introduction {
                ApresentationView(tutorialState: $tutorialState)
                
            } else if tutorialState == .acessApresentation {
                AcessApresentationView(tutorialState: $tutorialState)
            } else if tutorialState == .identity {
                IdentityView(tutorialState: $tutorialState, title: $title)
            } else if tutorialState == .joiningGroup {
                JoiningGroupView(tutorialState: $tutorialState, title: $title)
            } else if tutorialState == .home {
                HomeView()
            } else {
                Text("Erro")
                
            }
        }
        
    }
}
#Preview {
    ContentView()
}
