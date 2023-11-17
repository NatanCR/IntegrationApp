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
                AcessApresentationView(tutorialState: $tutorialState, email: title, password: title)
                //LoginView(tutorialState: $tutorialState)
            } else if tutorialState == .identity {
                IdentityView(tutorialState: $tutorialState, title: $title)
               // AdditionalInfoView(tutorialState: $tutorialState)
            } else if tutorialState == .joiningGroup {
//                JoiningGroupView(tutorialState: <#T##TutorialState#>, title: <#T##String#>, screenSize: <#T##arg#>)
               //CompletionView()
            } else {
                Text("Erro")
            }
        }
    }
}

#Preview {
    ContentView()
}
