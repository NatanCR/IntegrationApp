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
        ZStack {
            HStack {
                Text(objectVM.currentEvent.currentEvent?.eventName ?? "Integration")
            }
            .frame(width: 200, height: 730, alignment: .top)
            
            VStack {
                SegControlComponent(objectVM: objectVM)
            }
        }.ignoresSafeArea()
    }
}

//#Preview {
//    EventView()
//}
