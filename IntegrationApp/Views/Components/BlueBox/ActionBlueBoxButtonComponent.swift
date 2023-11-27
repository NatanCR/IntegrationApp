//
//  ActionBlueBoxButtonComponent.swift
//  IntegrationApp
//
//  Created by Natan de Camargo Rodrigues on 27/11/23.
//

import SwiftUI

struct ActionBlueBoxButtonComponent: View {
    let buttonTitle: String
    
    var body: some View {
        Button(action: {
            
        }, label: {
            ZStack {
                Rectangle()
                    .fill(Color(.financeBlueBoxButton))
                    .frame(width: 350, height: 44)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    .overlay {
                        Text(buttonTitle)
                            .foregroundStyle(Color.white)
                            .font(.system(size: 14, weight: .bold, design: .rounded))
                    }
                }
        })
    }
}


#Preview {
    ActionBlueBoxButtonComponent(buttonTitle: "Definir como pago")
}
