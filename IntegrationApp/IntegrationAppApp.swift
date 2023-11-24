//
//  IntegrationAppApp.swift
//  IntegrationApp
//
//  Created by Natan de Camargo Rodrigues on 28/10/23.
//

import SwiftUI
@main
struct IntegrationAppApp: App {
    @State private var surveyTitle: String = ""
    
    var body: some Scene {
        
        WindowGroup {
            GeometryReader { geo in
                CreateSurveyView(title: $surveyTitle)
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
