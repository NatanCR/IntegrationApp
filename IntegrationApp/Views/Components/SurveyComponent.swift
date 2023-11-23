//
//  SurveyComponent.swift
//  IntegrationApp
//
//  Created by Guilherme Borges on 16/11/23.
//

import SwiftUI

// Componente reutilizável para exibir uma enquete
struct SurveyComponent: View {
    var question: String
    @Binding var options: [SurveyOption]
    var isVotingEnabled: Bool
    @State private var selectedOptionId: Int?

    @Environment(\.screenSize) var screenSize

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(question)
                .font(.headline)

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

                ProgressBarComponent(value: Double(options[index].votes) / Double(totalVotes()))
                    .frame(height: 5)
            }
        }
        .padding()
        .frame(width: screenSize.width * 0.9, height: screenSize.height * 0.5)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.black, lineWidth: 1)
        )
    }

    func totalVotes() -> Int {
        return options.reduce(0) { $0 + $1.votes }
    }
}

//
//#Preview {
//    SurveyComponent()
//}
