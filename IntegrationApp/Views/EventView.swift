//
//  EventView.swift
//  IntegrationApp
//
//  Created by Barbara Argolo on 06/11/23.
//

import SwiftUI


struct EventView: View {
    var cornerRadius: CGFloat = 10
    @Binding var tutorialState: TutorialState
    @ObservedObject var objectVM: APIRequestVM
    
    var body: some View {
        NavigationStack {
            ZStack {
                //Event Title - navigate
                HStack {
                    Text("Event")
                }.frame(width: 200, height: 730, alignment: .top)
                ZStack() {
                    VStack {
                        SegControlComponent(objectVM: objectVM)
                    }
                    //CreateButtonComponent()
                }
            }.ignoresSafeArea()
        }
    }
}

//#Preview {
//    EventView()
//}
