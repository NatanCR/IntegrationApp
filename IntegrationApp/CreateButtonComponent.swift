//
//  CreateButtonComponent.swift
//  IntegrationApp
//
//  Created by Barbara Argolo on 06/11/23.
//

import SwiftUI

struct CreateButtonComponent: View {
    var body: some View {
        ZStack {
            Button {
                print("Adicionar ainda")
                
            } label: {
                Image(systemName: "plus")
                    .foregroundStyle(.white)
                    .font(.system(size: 20))
                    .fontWeight(.bold)
                    .padding()
                    .background(
                        Circle()
                            .fill(.orangeDetails)
                    )
            }
            .frame(width: 50, height: 50)
        }
        .frame(width: 300, height: 700, alignment: .bottomTrailing)
    }
}

#Preview {
    CreateButtonComponent()
}
