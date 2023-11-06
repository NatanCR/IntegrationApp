//
//  EventView.swift
//  IntegrationApp
//
//  Created by Barbara Argolo on 06/11/23.
//

import SwiftUI

struct EventView: View {
    var body: some View {
        ZStack {
            Color(.brown)
            
            //Event Title - navigate
            HStack {
                Text("Event").padding(.bottom, 700)
            }
            //Segmented Control
            ZStack(alignment: .top) {
                Color(.purple)
                VStack {
                    //View from segmented control- Scroll View
                    SegControlComponent()
                    ScrollViewComponent()
                }
                CreateButtonComponent()
                    .padding(.top, 620)
                    .padding(.leading, 250)
            }.ignoresSafeArea()
            .padding(.top, 100)
            .frame(width: 100)
            
            //favorite button
            
        }.ignoresSafeArea()
    }
}

#Preview {
    EventView()
}
