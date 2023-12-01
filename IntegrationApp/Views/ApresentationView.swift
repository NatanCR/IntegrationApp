//
//  ApresentationView.swift
//  IntegrationApp
//
//  Created by Guilherme Borges on 10/11/23.
//

import SwiftUI

struct ApresentationView: View {
    @Binding var tutorialState: TutorialState
    
    var body: some View {
        HStack {
            Spacer()
            VStack(alignment: .leading, spacing: -2) {
                Spacer()
                TitleComponent(title: "Bem-Vindo!")
                    .font(.title)
                    .foregroundColor(.segmentedControlSelected)
                    .padding(5)
                Text(" \"Nome do APP\" é um aplicativo direcionado \n aos alunos da Apple Developer Academy | \n Senac!")
                    .foregroundColor(.segmentedControlSelected)
                Spacer()
                ColaborateComponent(title: "Próximo", action: {
                    tutorialState = .acess
                })
                .foregroundColor(.white)
            }
            Spacer()
        }
        .background(Color.apresentationView)
    }
}

