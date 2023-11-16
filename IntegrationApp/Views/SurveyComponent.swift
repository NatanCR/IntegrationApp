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
                    HStack {
                        Text(option.name)
                        Spacer()
                        Text("\(option.votes) votes")
                    }
                }
            }
            .padding()
        }
}

//
//#Preview {
//    SurveyComponent()
//}
