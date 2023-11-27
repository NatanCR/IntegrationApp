//
//  SurveyComponent.swift
//  IntegrationApp
//
//  Created by Guilherme Borges on 16/11/23.
//

import SwiftUI


struct SurveyComponent: View {
    // var question: String
    @State private var newOption = ""
    @Binding var options: [SurveyOption]
    var isVotingEnabled: Bool
    @State private var selectedOptionId: Int?
    
    @Environment(\.screenSize) var screenSize
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.white, lineWidth: 1)
                .frame(width: screenSize.width * 0.9)
                .background(Color.primaryBlue)
            
            ScrollView {
                VStack(alignment: .leading, spacing: 10) {
                    // Text(question)
                    //     .font(.headline)
                    
                    if options.isEmpty {
                        // Mostra o TextField quando a lista está vazia
                        TextField("Toque para adicionar", text: $newOption, onCommit: {
                            if !newOption.isEmpty {
                                let newId = 1 // Como a lista está vazia, o ID pode começar em 1
                                options.append(SurveyOption(id: newId, name: newOption, votes: 0))
                                newOption = ""
                            }
                        })
//                            .background(Color.primaryBlue)
//                            .cornerRadius(10)
                    } else {
                        ForEach(options.indices, id: \.self) { index in
                            HStack {
                                // Bolinha que muda de cor ao votar
                                Circle()
                                    .stroke(Color.gray, lineWidth: 1)
                                    .background(Circle().fill(selectedOptionId == options[index].id ? Color.blue : Color.clear))
                                    .frame(width: 20, height: 20)
                                    .onTapGesture {
                                        if isVotingEnabled && selectedOptionId == nil {
                                            selectedOptionId = options[index].id
                                            options[index].votes += 1
                                        }
                                    }
                                
                                Text(options[index].name)
                                Spacer()
                                Text("\(options[index].votes)")
                            }
//                            .background(Color.primaryBlue)
//                            .cornerRadius(10)
                            Divider()
                                .frame(width: screenSize.width * 0.9, height: screenSize.height * 0.001)
                                .background(Color.white)
                            // ProgressBarComponent(value: Double(options[index].votes) / Double(totalVotes()))
                            //     .frame(height: 5)
                            
                            // Coloca o TextField após o último item
                            if index == options.count - 1 {
                                TextField("Toque para adicionar", text: $newOption, onCommit: {
                                    if !newOption.isEmpty {
                                        let newId = options.count + 1
                                        options.append(SurveyOption(id: newId, name: newOption, votes: 0))
                                        newOption = ""
                                    }
                                })
                            }
                        }.cornerRadius(10)
                    }
                }
                .padding()
            }.cornerRadius(10)
        }
        .frame(width: screenSize.width * 0.9)
    }
    
    func totalVotes() -> Int {
        return options.reduce(0) { $0 + $1.votes }
    }
}

//
//#Preview {
//    SurveyComponent()
//}
