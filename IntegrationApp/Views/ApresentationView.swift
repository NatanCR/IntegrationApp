//
//  ApresentationView.swift
//  IntegrationApp
//
//  Created by Guilherme Borges on 10/11/23.
//

import SwiftUI

struct ApresentationView: View {
    var body: some View {
        NavigationStack{
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
                    
                    NavigationLink(destination: AboutApresentationView(), label: {
                            ColaborateComponent(title: "Próximo")
                                .foregroundColor(.white)
                        }
                    )
                }
                Spacer()
            }
            .background(Color.apresentationView)
        }
    }
}

