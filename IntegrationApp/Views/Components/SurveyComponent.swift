//
//  SurveyComponent.swift
//  IntegrationApp
//
//  Created by Guilherme Borges on 16/11/23.
//

import SwiftUI

struct SurveyComponent: View {
    var options: [PollOption]

    var body: some View {
        //organiza a exibição das opções da enquete
        VStack(alignment: .leading, spacing: 10) {
            // Loop através das opções da enquete
            ForEach(options) { option in
                // organiza a exibição do nome da opção e a barra de progresso
                VStack {
                    // exibie o nome da opção e a quantidade de votos
                    HStack {
                        Text(option.name)
                        Spacer()
                        Text("\(option.votes)")
                    }
                    // Componente da barra de progresso com base na porcentagem de votos em relação ao total
                    ProgressBarComponent(value: Double(option.votes) / Double(totalVotes()))
                        .frame(height: 10)
                }
            }
        }
        .padding()
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
