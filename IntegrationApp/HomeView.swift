//
//  HomeView.swift
//  IntegrationApp
//
//  Created by rebeca primo on 06/11/23.
//

import SwiftUI

struct HomeView: View {
    //var event: [Event]
    
    var body: some View {
        ZStack {
            Color.blueBg
                .ignoresSafeArea()
            VStack {
                Header()
                MemberButton()
                
                Text("Nenhum evento criado...")
        //        if event.isEmpty {
        //            Text("Nenhum evento criado...")
        //        } else {
        //            VStack {
        //
        //            }
        //        }
                
                AddButton()
            }
            .navigationTitle("Integration")
        }
    }
}

#Preview {
    HomeView()
}
