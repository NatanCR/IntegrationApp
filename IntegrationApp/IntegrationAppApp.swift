//
//  IntegrationAppApp.swift
//  IntegrationApp
//
//  Created by Natan de Camargo Rodrigues on 28/10/23.
//

import SwiftUI
@main
struct IntegrationAppApp: App {
    
    var body: some Scene {
        WindowGroup {
            GeometryReader { geo in
                let minhaPesquisa = Poll(question: "Qual é a sua cor favorita?", options: [
                    PollOption(id: 1, name: "Vermelho", votes: 0),
                    PollOption(id: 2, name: "Azul", votes: 0),
                    PollOption(id: 3, name: "Verde", votes: 0)
                ])
                
                SurveyView(poll: minhaPesquisa)
                    .environment(\.screenSize, geo.size)
            }
        }
    }
}


private struct ScreenSizeKey : EnvironmentKey {
    static let defaultValue: CGSize = .zero
}

extension EnvironmentValues {
    var screenSize: CGSize {
        get { self[ScreenSizeKey.self] }
        set { self[ScreenSizeKey.self] = newValue }
    }
}
