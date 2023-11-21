//
//  AddButton.swift
//  IntegrationApp
//
//  Created by rebeca primo on 06/11/23.
//

import SwiftUI

struct AddButton: View {
    var view: AnyView
    
    init(view: AnyView) {
        self.view = view
    }
    
    var body: some View {
        NavigationLink(destination: view, label: {
            VStack {
                Image(systemName: "plus")
                    .foregroundColor(.white)
                    .frame(width: 60, height: 60)
                    .background(Color.orangeSenac)
                    .clipShape(Circle())
                    .font(.system(size: 25))
            }
        })
    }
}

#Preview {
        AddButton(view: AnyView(HomeView()))
}
