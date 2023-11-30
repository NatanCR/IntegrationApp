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
                        }).foregroundStyle(Color.textSurvey)
                    } else {
                        ForEach(options.indices, id: \.self) { index in
                            HStack {
                                Spacer()
                                    .frame(width: screenSize.width * 0.04)
                                // Bolinha que muda de cor ao votar
                                Circle()
                                    .stroke(lineWidth: 1.3)
                                    .foregroundStyle(Color.segmentedControlSelected)
                                    .background(Circle().fill(selectedOptionId == options[index].id ? Color.blue : Color.clear))
                                    .frame(width: screenSize.width * 0.06, height: screenSize.height * 0.05)
                                
                                    .onTapGesture {
                                        if isVotingEnabled && selectedOptionId == nil {
                                            selectedOptionId = options[index].id
                                            options[index].votes += 1
                                        }
                                    }
                                
                                Text(options[index].name)
                                Spacer()
                                
                                Text("\(options[index].votes)")
                                Spacer()
                                    .frame(width: screenSize.width * 0.04)
                            }
                            Divider()
                                .frame(width: screenSize.width * 0.9, height: screenSize.height * 0.001)
                                .background(Color.white)
                            // ProgressBarComponent(value: Double(options[index].votes) / Double(totalVotes()))
                            //     .frame(height: 5)
                            
                            // Coloca o TextField após o último item
                            if index == options.count - 1 {
                                HStack{
                                    Spacer().frame(width: screenSize.width * 0.04)
                                    
                                    
                                    Circle()
                                        .strokeBorder(style: StrokeStyle(lineWidth: 2, dash: [2]))
                                        .foregroundStyle(Color.segmentedControlSelected)
                                        .frame(width: screenSize.width * 0.06, height: screenSize.height * 0.05)
                                    
                                    TextField("Toque para adicionar", text: $newOption, onCommit: {
                                        if !newOption.isEmpty {
                                            let newId = options.count + 1
                                            options.append(SurveyOption(id: newId, name: newOption, votes: 0))
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
    
    func totalVotes() -> Int {
        return options.reduce(0) { $0 + $1.votes }
    }
}

//
//#Preview {
//    SurveyComponent()
//}
