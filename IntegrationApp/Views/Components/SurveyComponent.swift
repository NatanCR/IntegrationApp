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

    @Environment(\.screenSize) var screenSize

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(question)
                .font(.headline)

            ForEach(options.indices, id: \.self) { index in
                Button(action: {
                    self.options[index].votes += 1
                }) {
                    HStack {
                        Text(self.options[index].name)
                        Spacer()
                        Text("\(self.options[index].votes)")
                    }

                    ProgressBarComponent(value: Double(self.options[index].votes) / Double(totalVotes()))
                        .frame(height: 5)
                }
                .buttonStyle(PlainButtonStyle())
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
