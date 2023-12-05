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
            Rectangle()
                .fill(Color.blueMedium)
                .frame(width: 400, height: 150)
                .position(x: 200, y: 75)
            //Text("exemplo")
                //.position(x: , y: 75)
        }
        .ignoresSafeArea()
    }
}

#Preview {
    Header()
}
