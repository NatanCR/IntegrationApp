//
//  AddIconComponent.swift
//  IntegrationApp
//
//  Created by Guilherme Borges on 06/11/23.
//

import SwiftUI

struct AddIconComponent: View {
    var addIconAction: () -> Void
    
    var body: some View {
        Image("imgplus")
            .font(.largeTitle)
            .foregroundColor(.blue)
            .onTapGesture {
                addIconAction()
            }
    }
}

//#Preview {
//    AddIconComponent(addIconAction: )
//}
