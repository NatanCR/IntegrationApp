//
//  ScrollViewComponent.swift
//  IntegrationApp
//
//  Created by Barbara Argolo on 06/11/23.
//

import SwiftUI

struct ScrollViewComponent: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                //Enquete criada
                ForEach(0..<15) {
                    Text("Enquete \($0)")
                        .frame(width: 350, height: 154)
                        .background(Color("QuizBlue"))
                }
            }
        }.ignoresSafeArea()
    }
}

#Preview {
    ScrollViewComponent()
}
