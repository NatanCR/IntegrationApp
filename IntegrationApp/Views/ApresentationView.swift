//
//  ApresentationView.swift
//  IntegrationApp
//
//  Created by Guilherme Borges on 10/11/23.
//

import SwiftUI

struct ApresentationView: View {
    var body: some View {
        HStack {
            Spacer()
            VStack(alignment: .leading) {
                Spacer()
                TitleComponent(title: "BEM-VINDO!")
                    .font(.title)
                    .foregroundColor(.segmentedControlSelected)
                    .padding(5)
                Text(" \"Nome do APP\" é um aplicativo direcionado \n aos alunos da Apple Developer Academy | \n Senac!")
                    .foregroundColor(.segmentedControlSelected)
                Spacer()
                ColaborateComponent()
            }
            Spacer()
        }
    }
}

