//
//  TaskComponent.swift
//  IntegrationApp
//
//  Created by Barbara Argolo on 07/11/23.
//

import SwiftUI


struct RectangleBoxComponent: View {
    //    @State var title: String
    //    @State var icon: String
    //    @State var date: Int
    //
    
    var body: some View {
        VStack{
            ZStack {
                
                
                Rectangle()
                    .fill(
                        Color(.primaryBlue))
                    .frame(width: 350, height: 154)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                HStack(spacing: 250) {
                    Rectangle()
                        .fill(
                            Color(.segmentedControlSelected)
                        )
                        .frame(width: 40,height: 40)
                        .clipShape(RoundedRectangle(cornerRadius: 5))
                    //componente do botao
                    CheckBoxConfirmation()
                }
                .padding(.bottom, 80)
                HStack(spacing: 195) {
                    Text("Chegandor")
                    Text("data ")
                    
                }.padding(.bottom, 10)
                VStack {
                    //esse text irá receber o nome das pessoas do banco
                    Text("oiiiiidddddddddddiiiiiiiiddddddddddddiddddddd")
                        .frame( maxWidth: .infinity ,alignment: .leading)
                        .lineLimit(1)
                }.padding(.top, 45)
                    .padding(.leading, 20)
                    .padding(.trailing, 150)
                
                
                ColaborateComponent(title:"").padding(.top, 110)
            }
        }
    }
}
//checkbox
struct CheckBoxConfirmation: View {
    @State var changeStateCheckBox = false
    
    
    var body: some View {
        Button(action: {
            print("checkbox")
            //ternario para mudar estado
            changeStateCheckBox.toggle()
            //funcao para enviar o dado das pessoas que irão participar aqui
            
        }, label: {
            Image(changeStateCheckBox ? "CheckBoxFill" : "CheckBoxNotFill")
            
        })
    }
}
//button to colaborate/cancel colaboration
struct ColaborateComponent: View {
    let title: String
    var body: some View {
        NavigationLink(
            destination: AboutApresentationView(),
            label: {
                ZStack {
                    Rectangle()
                        .fill(
                            Color(.segmentedControlSelected))
                        .frame(width: 350, height: 44)
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                    Text(title)
                        .foregroundColor(.white)
                }
            })
    }
}


struct RoundedCorners: View {
    
    var body: some View {
        Text("dps faço isso")
    }
}

#Preview {
    RectangleBoxComponent()
}
