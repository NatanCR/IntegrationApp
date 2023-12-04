//
//  SurveyComponent.swift
//  IntegrationApp
//
//  Created by Guilherme Borges on 16/11/23.
//

import SwiftUI
// Componente SwiftUI para criar e gerenciar uma enquete
struct SurveyComponent: View {
    //var question: String
    var isVotingEnabled: Bool // Variável para habilitar ou desabilitar a votação
    @State private var newOption = "" // Estado para armazenar a nova opção de enquete
    @State private var selectedOptionId: String? // Estado para armazenar a opção selecionada como String
    @Binding var options: [QuizAnswer] // Binding para as opções da enquete

    @Environment(\.screenSize) var screenSize
    
    var body: some View {
        ZStack {
            // Fundo retangular com bordas arredondadas
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.white, lineWidth: 1)
                .frame(width: screenSize.width * 0.9)
                .background(Color.primaryBlue)
            
            ScrollView {
                VStack(alignment: .leading, spacing: 10) {
                    //Text(question).font(.headline)
                    
                    if options.isEmpty {
                        // Campo de texto para adicionar uma nova opção quando a lista está vazia
                        TextField("Toque para adicionar", text: $newOption, onCommit: {
                            if !newOption.isEmpty {
                                let newOptionId = UUID().uuidString
                                options.append(QuizAnswer(optionId: newOptionId, title: newOption, votes: 0))
                                newOption = ""
                            }
                        }).foregroundStyle(Color.textSurvey)
                    } else {
                        ForEach(options.indices, id: \.self) { index in
                            HStack {
                                Spacer().frame(width: screenSize.width * 0.04)

                                // Círculo que indica a opção selecionada
                                Circle()
                                    .stroke(lineWidth: 1.3)
                                    .foregroundStyle(Color.segmentedControlSelected)
                                    .background(Circle().fill(selectedOptionId == options[index].optionId ? Color.blue : Color.clear))
                                    .frame(width: screenSize.width * 0.06, height: screenSize.height * 0.05)
                                    .onTapGesture {
                                        if isVotingEnabled && selectedOptionId == nil {
                                            selectedOptionId = options[index].optionId
                                            options[index].votes? += 1
                                        }
                                    }
                                
                                Text(options[index].title ?? "") // Mostra o nome da opção
                                Spacer()
                                
                                Text("\(options[index].votes ?? 0)") // Mostra o número de votos
                                Spacer().frame(width: screenSize.width * 0.04)
                            }
                            Divider()
                                .frame(width: screenSize.width * 0.9, height: screenSize.height * 0.001)
                                .background(Color.white)
                            
                            // Campo de texto para adicionar uma nova opção após a última opção existente
                            if index == options.count - 1 {
                                HStack{
                                    Spacer().frame(width: screenSize.width * 0.04)
                                    
                                    Circle()
                                        .strokeBorder(style: StrokeStyle(lineWidth: 2, dash: [2]))
                                        .foregroundStyle(Color.segmentedControlSelected)
                                        .frame(width: screenSize.width * 0.06, height: screenSize.height * 0.05)
                                    
                                    TextField("Toque para adicionar", text: $newOption, onCommit: {
                                        if !newOption.isEmpty {
                                            let newOptionId = UUID().uuidString
                                            options.append(QuizAnswer(optionId: newOptionId, title: newOption, votes: 0))
                                            newOption = ""
                                        }
                                    })
                                    .foregroundStyle(Color.textSurvey)
                                }
                            }
                        }.cornerRadius(10)
                    }
                }
                .padding()
            }.cornerRadius(10)
        }
        .frame(width: screenSize.width * 0.9)
    }
    
    // Função para calcular o total de votos
    func totalVotes() -> Int {
        return options.reduce(0) { $0 + ($1.votes ?? 0) }
    }
}

//
//#Preview {
//    SurveyComponent()
//}
