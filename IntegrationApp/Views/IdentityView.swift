//
//  IdentityView.swift
//  IntegrationApp
//
//  Created by Guilherme Borges on 13/11/23.
//

import SwiftUI

struct IdentityView: View {
    @Binding var tutorialState: TutorialState
    @Binding var title: String
    @Environment (\.screenSize) var screenSize
    
    var body: some View {
        HStack {
            Spacer()
            VStack(alignment: .leading, spacing: -2) {
                Spacer()
                TitleComponent(title:"Identidade")
                    .font(.title)
                    .foregroundColor(.segmentedControlSelected)
                    .padding(5)
                Text(" Para facilitar o contato entre os usuários,\n insira a baixo seu nome/apelido:")
                    .foregroundColor(.segmentedControlSelected)
                //aqui no text virá de uma observable class para colocar esse nome no firebase
                TextFieldComponent(text: $title, placeholder: "Digite seu nome/apelido...")
                    .frame(width: screenSize.width * 0.9, height: screenSize.height * 0.12)

                Spacer()
                     ColaborateComponent(title: "Próximo", action: {
                         tutorialState = .joiningGroup
            })
            .foregroundColor(.white)
            }
            Spacer()
        }
        .background(Color.apresentationView)
    }
}

//#Preview {
//    IdentityView()
//}
