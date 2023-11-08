//
//  IconComponent.swift
//  IntegrationApp
//
//  Created by Guilherme Borges on 06/11/23.
//

import SwiftUI

struct IconComponent: View {
    var iconName: String
    
    var body: some View {
            Button(action: {
                
            }, label: {
                Image(systemName: iconName)
                    .foregroundStyle(Color.white)
            })
            .frame(width: 60, height: 60)
            .background(
                RoundedRectangle(cornerRadius: 15, style: .continuous)
                    .fill(Color.primaryBlue)
                    
            )
    }
}

#Preview {
    IconComponent(iconName: "")
}
