//
//  EventComponent.swift
//  IntegrationApp
//
//  Created by rebeca primo on 27/11/23.
//

import SwiftUI

struct EventComponent: View {
    var eventTitle: String
    var eventDate: String
//    var members: [Member]
    
    var body: some View {
        ZStack(alignment: .leading) {
            Rectangle()
                .frame(width: 355, height: 120)
                .foregroundColor(Color.segmentedControlNotSelected)
                .cornerRadius(20)
            Text(eventTitle.prefix(15))
                .offset(x: 80)
                .offset(y: -35)
                .foregroundColor(.black)
                .font(.headline)
            Text("Natan, Rebeca e Thiago")
                .offset(x: 80)
                .offset(y: -10)
                .foregroundColor(.black)
                .font(.callout)
            Text(eventDate)
                .offset(x: 250)
                .offset(y: -35)
                .foregroundColor(.black)
                .font(.headline)
            IconComponent(iconName: "CheckBoxFill")
                .offset(x: 10)
                .offset(y: -18)
            
            Button(action: {
                print("Botão pressionado!")
            }) {
                ZStack {
                    Rectangle()
                        .frame(width: 355, height: 60)
                        .foregroundColor(Color.segmentedControlSelected)
                        .cornerRadius(20)
                        .offset(y: 55)
                    Text("Participar")
                        .foregroundColor(.white)
                        .font(.headline)
                        .offset(y: 55)
                }
            }
        }
    }
}

//#Preview {
//    EventComponent()
//}
