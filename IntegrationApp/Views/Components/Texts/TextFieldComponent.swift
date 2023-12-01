//
//  ComponentTextField.swift
//  IntegrationApp
//
//  Created by Guilherme Borges on 06/11/23.
//

import SwiftUI

struct TextFieldComponent: View {
    @Binding var valueText: String
    let placeholder: String
    @Environment (\.screenSize) var screenSize
    
    var body: some View {
        TextField(placeholder, text: $valueText)
            .padding(.horizontal, 8)
            .frame(width: screenSize.width * 0.9, height: screenSize.height * 0.07)
            .background(Color.primaryBlue)
            .cornerRadius(15)
            .foregroundColor(Color("TextFieldColor"))
    }
}

struct SecureTextFieldComponent: View {
    @Binding var text: String
    var placeholder: String
    @Environment (\.screenSize) var screenSize
    var body: some View {
        SecureField(placeholder, text: $text)
            .padding(.horizontal, 8)
            .frame(width: screenSize.width * 0.9, height: screenSize.height * 0.07)
            .background(Color.primaryBlue)
            .cornerRadius(15)
    }
}


//#Preview {
//    TextFieldComponent(text: "", placeholder: "test")
//}
