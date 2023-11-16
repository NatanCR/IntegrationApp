//
//  SurveyView.swift
//  IntegrationApp
//
//  Created by Guilherme Borges on 16/11/23.
//

import SwiftUI

struct PollOption: Identifiable {
    let id: Int
    var name: String
    var votes: Int
}

class Poll: ObservableObject {
    @Published var question: String
    @Published var options: [PollOption]

    init(question: String, options: [PollOption]) {
        self.question = question
        self.options = options
    }

    func vote(optionId: Int) {
        if let index = options.firstIndex(where: { $0.id == optionId }) {
            options[index].votes += 1
        }
    }
}

struct SurveyView: View {
    @ObservedObject var poll: Poll
    @State private var showingResults = false
    @State private var newOption = ""
    @State private var votingCompleted = false

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(poll.question)
                .font(.headline)

            ForEach(poll.options) { option in
                HStack {
                    Circle()
                        .fill(option.votes > 0 ? Color.blue : Color.gray) // Preenche a bolinha se houver votos
                        .frame(width: 10, height: 10)
                        .padding(.trailing, 5)
                    
                    Button(action: {
                        if !votingCompleted {
                            poll.vote(optionId: option.id)
                            votingCompleted = true
                        }
                    }) {
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

            TextField("Touch to add", text: $newOption, onCommit: {
                if !newOption.isEmpty {
                    let newId = poll.options.count + 1
                    let newOption = PollOption(id: newId, name: self.newOption, votes: 0)
                    poll.options.append(newOption)
                    self.newOption = ""
                }
            })
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding()

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
