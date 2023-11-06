//
//  Header.swift
//  IntegrationApp
//
//  Created by rebeca primo on 06/11/23.
//

import SwiftUI

struct Header: View {
    var body: some View {
        ZStack {
            VStack {
                Rectangle()
                    .fill(Color.blueMedium)
                    .frame(width: .infinity, height: 150)
                Spacer()
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    Header()
}
