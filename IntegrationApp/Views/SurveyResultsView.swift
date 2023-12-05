//
//  SurveyResultsView.swift
//  IntegrationApp
//
//  Created by Guilherme Borges on 05/12/23.
//

import SwiftUI

struct SurveyResultsView: View {
    @Binding var options: [QuizAnswer]
    @Environment(\.screenSize) var screenSize
    @State private var selectedOptionId: String?

    var body: some View {
        ZStack {
            VStack(alignment: .leading, spacing: 10) {
                ForEach(options.indices, id: \.self) { index in
                    VStack(spacing: 5) {
                        HStack {
                            Spacer().frame(width: screenSize.width * 0.04)

                            // Círculo que indica a opção selecionada
                            Circle()
                                .stroke(lineWidth: 1.3)
                                .foregroundStyle(Color.segmentedControlSelected)
                                .background(Circle().fill(selectedOptionId == options[index].optionId ? Color.blue : Color.clear))
                                .frame(width: screenSize.width * 0.06, height: screenSize.height * 0.05)
                                .onTapGesture {
                                    if selectedOptionId == nil {
                                        selectedOptionId = options[index].optionId
                                        options[index].votes? += 1
                                    }
                                }
                            
                            Text(options[index].title ?? "") // Mostra o nome da opção
                            Spacer()
                            
                            Text("\(options[index].votes ?? 0)") // Mostra o número de votos
                            Spacer().frame(width: screenSize.width * 0.04)
                        }

                        // ProgressBarComponent
                        ProgressBarComponent(value: totalVotes() > 0 ? Double(options[index].votes ?? 0) / Double(totalVotes()) : 0)
                            .frame(height: 10)
                    }
                }
            }
            .padding()
        }
        .frame(width: screenSize.width * 0.9)
    }
    private func totalVotes() -> Int {
        return options.reduce(0) { $0 + ($1.votes ?? 0) }
    }
}



//#Preview {
//    SurveyResultsView()
//}
