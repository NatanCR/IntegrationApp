//
//  TitleComponent.swift
//  IntegrationApp
//
//  Created by Guilherme Borges on 06/11/23.
//

import SwiftUI

struct TitleComponent: View {
    let title: String
    
    var body: some View {
        Text(title)
            .fontWeight(.bold)
    }
}

#Preview {
    TitleComponent(title: "")
}
