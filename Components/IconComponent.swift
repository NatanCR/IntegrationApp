//
//  IconComponent.swift
//  IntegrationApp
//
//  Created by Guilherme Borges on 06/11/23.
//

import SwiftUI

struct IconComponent: View {
    var imageName: String
    
    var body: some View {
        Image(imageName)
            .font(.largeTitle)
    }
}

#Preview {
    IconComponent(imageName: "")
}
