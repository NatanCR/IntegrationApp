//
//  ContentView.swift
//  IntegrationApp
//
//  Created by Natan de Camargo Rodrigues on 28/10/23.
//

import SwiftUI
import Amplify

struct ContentView: View {
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
                .task {
                    await DataManagement.shared.createNewEvent(eventName: "Primeiro Integration")
                }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
