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
            //sobrepoe dois retângulos, criando a barra de progresso
            ZStack(alignment: .leading) {
                // Retângulo de fundo com opacidade para representar a parte não preenchida
                Rectangle()
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .opacity(0.3)
                    .foregroundColor(Color.gray)

                // Retângulo da barra de progresso preenchido proporcionalmente ao valor fornecido
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
