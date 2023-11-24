//
//  NumberFieldComponent.swift
//  IntegrationApp
//
//  Created by Natan de Camargo Rodrigues on 24/11/23.
//

import SwiftUI

struct NumberFieldComponent: View {
    @Binding var totalValue: Double
    @Environment (\.screenSize) var screenSize
    
    var body: some View {
        TextField("R$ 00.00", value: $totalValue, format: .number)
            .padding(.horizontal, 8)
            .frame(width: screenSize.width * 0.9, height: screenSize.height * 0.07)
            .background(Color.primaryBlue)
            .cornerRadius(15)
            .foregroundColor(Color("TextFieldColor"))
    }
}

//#Preview {
//    NumberFieldComponent(totalValue: , placeholder: "")
//}
