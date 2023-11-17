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
        VStack(alignment: .leading, spacing: 10) {
            ForEach(options) { option in
                VStack {
                    HStack {
                        Text(option.name)
                        Spacer()
                        Text("\(option.votes) votes")
                    }
                    ProgressBarComponent(value: Double(option.votes) / Double(totalVotes()))
                        .frame(height: 10)
                }
            }
        }
        .padding()
    }

    func totalVotes() -> Int {
        return options.reduce(0) { $0 + $1.votes }
    }
}



//
//#Preview {
//    SurveyComponent()
//}
