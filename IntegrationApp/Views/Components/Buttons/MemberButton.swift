//
//  MemberButton.swift
//  IntegrationApp
//
//  Created by rebeca primo on 06/11/23.
//

import SwiftUI

struct MemberButton: View {
    var view: AnyView
    
    init(view: AnyView) {
        self.view = view
    }
    
    var body: some View {
        NavigationLink(destination: view, label: {
            VStack {
                Image(systemName: "person.2.fill")
                    .foregroundColor(.black)
                    .frame(width: 50, height: 50)
                    .font(.system(size: 30))
            }
        })
    }
}


//#Preview {
//    MemberButton(view: AnyView(MembersView()))
//}
