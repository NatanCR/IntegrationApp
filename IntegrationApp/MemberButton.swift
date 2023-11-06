//
//  MemberButton.swift
//  IntegrationApp
//
//  Created by rebeca primo on 06/11/23.
//

import SwiftUI

struct MemberButton: View {
    var body: some View {
        //NavigationLink(destination: view, label: {
        VStack {
            Image(systemName: "person.2.fill")
                .foregroundColor(.black)
                .frame(width: 70, height: 70)
                .font(.system(size: 40))
            //})
        }
    }
}

#Preview {
    MemberButton()
}
