//
//  EventView.swift
//  IntegrationApp
//
//  Created by Barbara Argolo on 06/11/23.
//

import SwiftUI


struct EventView: View {
    var cornerRadius: CGFloat = 10
    
    var body: some View {
        NavigationStack {
            ZStack {
                //Event Title - navigate
                HStack {
                    Text("Event")
                }.frame(width: 200, height: 730, alignment: .top)
                ZStack() {
                    VStack {
                        SegControlComponent()
                    }
                    CreateButtonComponent()
                }
            }.ignoresSafeArea()
        }
    }
}

#Preview {
    EventView()
}
