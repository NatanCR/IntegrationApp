//
//  GridIconComponent.swift
//  IntegrationApp
//
//  Created by Natan de Camargo Rodrigues on 23/11/23.
//

import SwiftUI

struct GridIconComponent: View {
    @State private var icons: [String] = ["volleyball.fill","movieclapper.fill","cup.and.saucer.fill","birthday.cake.fill"]
    var body: some View {
        Section(header: Text("Ícone").bold().foregroundColor(.black)) {
            LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 4), spacing: 10) {
                ForEach(icons, id: \.self) { iconName in
                    IconComponent(iconName: iconName)
                }
            }
        }
    }
}

#Preview {
    GridIconComponent()
}
