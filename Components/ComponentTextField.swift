//
//  ComponentTextField.swift
//  IntegrationApp
//
//  Created by Guilherme Borges on 06/11/23.
//

import SwiftUI

struct ComponentTextField: View {
    @Binding var text: String
    var placeholder: String
    
    var body: some View {
        TextField(placeholder, text: $text)
//            .padding()
//            .background(Color.gray.opacity(0.2))
            .cornerRadius(10)
    }
}

//#Preview {
//    ComponentTextField(text: text, placeholder: "")
//}
