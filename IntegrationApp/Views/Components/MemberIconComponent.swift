//
//  MemberIconComponent.swift
//  IntegrationApp
//
//  Created by Natan de Camargo Rodrigues on 01/12/23.
//

import SwiftUI

struct MemberIconComponent: View {
    var memberName: String
    var memberIcon: String
    
    var body: some View {
        VStack {
            Image(.backCirculo) // Substitua "memberIcon" pelo nome real da sua imagem no conjunto de assets
                .resizable()
                .frame(width: 75, height: 75) // Ajuste o tamanho conforme necessário
                .clipShape(Circle())
                .overlay(
                    Text(memberIcon)
                        .font(.system(size: 40))
                        .foregroundColor(.white)
                        .padding(5)
                    , alignment: .center)
            
            
            Text(memberName)
                .font(.custom("Poppins-Regular", size: 12))
        }
    }
}

#Preview {
    MemberIconComponent(memberName: "Natan", memberIcon: "😁")
}
