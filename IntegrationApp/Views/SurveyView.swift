//
//  SurveyView.swift
//  IntegrationApp
//
//  Created by Guilherme Borges on 16/11/23.
//

import SwiftUI

// Definição da estrutura para representar uma opção de enquete
struct PollOption: Identifiable {
    let id: Int
    var name: String
    var votes: Int
}

// Definição da classe para representar uma enquete observável
class Poll: ObservableObject {
    @Published var question: String
    @Published var options: [PollOption]

    // Inicialização da enquete com uma pergunta e uma lista de opções
    init(question: String, options: [PollOption]) {
        self.question = question
        self.options = options
    }

    // Método para registrar um voto em uma opção específica
    func vote(optionId: Int) {
        if let index = options.firstIndex(where: { $0.id == optionId }) {
            options[index].votes += 1
        }
    }
}

// Definição da view para exibir uma enquete
struct SurveyView: View {
    @ObservedObject var poll: Poll
    @State private var showingResults = false
    @State private var newOption = ""
    @State private var votingCompleted = false

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            // Exibição da pergunta da enquete
            Text(poll.question)
                .font(.headline)

            // Loop através das opções da enquete
            ForEach(poll.options) { option in
                HStack {
                    // Exibição de uma bolinha preenchida se houver votos na opção
                    Circle()
                        .fill(option.votes > 0 ? Color.blue : Color.gray)
                        .frame(width: 10, height: 10)
                        .padding(.trailing, 5)
                    
                    // Botão para votar em uma opção
                    Button(action: {
                        // Verifica se a votação ainda não foi concluída
                        if !votingCompleted {
                            // Registra o voto na opção selecionada e marca a votação como concluída
                            poll.vote(optionId: option.id)
                            votingCompleted = true
                        }
                    }) {
                        // Exibição do nome da opção e a quantidade de votos
                        HStack {
                            Text(option.name)
                            Spacer()
                            Text("\(option.votes)")
                        }
                    }
                    .buttonStyle(PlainButtonStyle())
                    .disabled(votingCompleted) // Desabilita o botão se a votação já foi concluída
                }
                .padding(.vertical, 5)
            }

            // Campo de texto para adicionar uma nova opção à enquete
            TextField("Touch to add", text: $newOption, onCommit: {
                // Adiciona uma nova opção se o campo de texto não estiver vazio
                if !newOption.isEmpty {
                    let newId = poll.options.count + 1
                    let newOption = PollOption(id: newId, name: self.newOption, votes: 0)
                    poll.options.append(newOption)
                    self.newOption = ""
                }
            })
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding()

            // Botão para exibir os resultados da enquete em uma folha (sheet)
            Button("Show Results") {
                showingResults.toggle()
            }
            .sheet(isPresented: $showingResults) {
                SurveyComponent(options: poll.options)
            }
        }
        .padding()
    }
}


//#Preview {
//    SurveyView(poll: <#Poll#>)
//}
