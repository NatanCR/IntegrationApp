//
//  EventView.swift
//  IntegrationApp
//
//  Created by Barbara Argolo on 06/11/23.
//

import SwiftUI


struct EventView: View {
    @ObservedObject var objectVM: APIRequestVM
    
    var body: some View {
        VStack {
            SegControlComponent(objectVM: objectVM)
        }
        .navigationTitle("\(objectVM.currentEvent.currentEvent?.eventName ?? "Integration")")
        .navigationBarTitleDisplayMode(.inline)
        .toolbarBackground(
            Color.navigationArea,
            for: .navigationBar
        )
        .toolbarBackground(.visible, for: .navigationBar)
        .ignoresSafeArea()
    }
}

//#Preview {
//    EventView()
//}
