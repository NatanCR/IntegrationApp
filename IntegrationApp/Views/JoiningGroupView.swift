//
//   JoiningGroupView.swift
//  IntegrationApp
//
//  Created by Guilherme Borges on 13/11/23.
//

import SwiftUI

struct JoiningGroupView: View {
    @Binding var tutorialState: TutorialState
    @Binding var title: String
    @Environment (\.screenSize) var screenSize
    
    var body: some View {
        HStack {
            Spacer()
            VStack(alignment: .leading, spacing: -2) {
                Spacer()
                TitleComponent(title:"Entrando no Grupo")
                    .font(.title)
                    .foregroundColor(.segmentedControlSelected)
                    .padding(5)
                Text(" Agora, entre em contato com um ”Mentor” e \n insira o PIN a baixo:")
                    .foregroundColor(.segmentedControlSelected)
                TextFieldComponent(valueText: $title, placeholder: "Digite o PIN da sala...")
                    .frame(width: screenSize.width * 0.9, height: screenSize.height * 0.12)

                
                Spacer()
                ColaborateComponent(title: "Próximo") {
                    tutorialState = .home
                
                }
                    .foregroundColor(.white)
            }
            Spacer()
        }
        .background(Color.apresentationView)
    }
}

//#Preview {
//    JoiningGroupView()
//}
