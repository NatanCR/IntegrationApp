//
//  SurveyComponent.swift
//  IntegrationApp
//
//  Created by Guilherme Borges on 16/11/23.
//

import SwiftUI

struct SurveyComponent: View {
    var options: [PollOption]
    @Environment (\.screenSize) var screenSize

    var body: some View {
        // Adiciona um quadrado em volta do componente da enquete
        RoundedRectangle(cornerRadius: 10) // ajuste o valor do raio conforme necessário
            .stroke(Color.black, lineWidth: 1) // ajuste a cor e a largura da linha conforme necessário
            .padding(10) // ajuste o espaçamento interno conforme necessário
            .overlay(
                // Organiza a exibição das opções da enquete
                VStack(alignment: .leading, spacing: 10) {
                    
                    // Loop através das opções da enquete
                    ForEach(options) { option in
                        // Organiza a exibição do nome da opção e a barra de progresso
                        VStack {
                            
                            // Exibe o nome da opção e a quantidade de votos
                            HStack {
                                Text(option.name)
                                Spacer()
                                Text("\(option.votes)")
                            }
                            // Componente da barra de progresso com base na porcentagem de votos em relação ao total
                            ProgressBarComponent(value: Double(option.votes) / Double(totalVotes()))
                                .frame(height: 5)
                        }
                    }
                }
                .padding()
            )
            .frame(width: screenSize.width * 0.9, height: screenSize.height * 0.5)
    }

    // Método para calcular o total de votos em todas as opções da enquete
    func totalVotes() -> Int {
        return options.reduce(0) { $0 + $1.votes }
    }
}

//
//#Preview {
//    SurveyComponent()
//}
