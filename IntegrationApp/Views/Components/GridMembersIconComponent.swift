//
//  GridMembersIconComponent.swift
//  IntegrationApp
//
//  Created by Natan de Camargo Rodrigues on 01/12/23.
//

import SwiftUI

struct GridMembersIconComponent: View {
    @Environment (\.screenSize) var screenSize
    let data: [Member] = [Member(id: "Natan", name: "Natan", financeMember: true, icon: "😁"),Member(id: "Nata", name: "Natan", financeMember: true, icon: "😁"),Member(id: "Nat", name: "Natan", financeMember: true, icon: "😁"),Member(id: "Na", name: "Natan", financeMember: true, icon: "😁"),Member(id: "N", name: "Natan", financeMember: true, icon: "😁"),Member(id: "tan", name: "Natan", financeMember: true, icon: "😁"),Member(id: "Natanaa", name: "Natan", financeMember: true, icon: "😁"),Member(id: "Naan", name: "Natan", financeMember: true, icon: "😁"),Member(id: "Natana", name: "Natan", financeMember: true, icon: "😁"),Member(id: "Nan", name: "Natan", financeMember: true, icon: "😁"),Member(id: "Nana", name: "Natan", financeMember: true, icon: "😁"),Member(id: "Nn", name: "Natan", financeMember: true, icon: "😁")]
    
    let rows = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
        var body: some View {
        ScrollView(.horizontal) {
            LazyHGrid(rows: rows, spacing: 50, content: {
                ForEach(data, id: \.self) { member in
                    MemberIconComponent(memberName: member.name ?? "", memberIcon: member.icon ?? "")
                }
            })
        }
        .padding()
        .frame(height: 500)
    }
}

#Preview {
    GridMembersIconComponent()
}
