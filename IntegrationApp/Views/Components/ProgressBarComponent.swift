//
//  ProgressionBarComponent.swift
//  IntegrationApp
//
//  Created by Guilherme Borges on 17/11/23.
//

import SwiftUI

struct ProgressBarComponent: View {
    var value: Double

    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle()
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .opacity(0.3)
                    .foregroundColor(Color.gray)

                Rectangle()
                    .frame(width: min(CGFloat(self.value) * geometry.size.width, geometry.size.width), height: geometry.size.height)
                    .foregroundColor(Color.blue)
            }
            .cornerRadius(5.0)
        }
    }
}


//#Preview {
//    ProgressBarComponent()
//}
