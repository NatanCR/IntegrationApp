//
//  TaskSubview.swift
//  IntegrationApp
//
//  Created by Barbara Argolo on 07/11/23.
//

import SwiftUI

struct TaskSubview: View {
    @ObservedObject var objectVM: APIRequestVM
    
    var body: some View {
        VStack {
//            if objectVM.currentEvent.currentEvent?.task?.count == 0 {
//                VStack(alignment: .center) {
//                    Text("Nenhuma enquete criada...")
//                        .font(.custom("Poppins-Regular", size: 15))
//                        .foregroundStyle(Color.blueText)
//                    Image(.imagemEnquete)
//                        .resizable()
//                        .scaledToFit()
//                }
//            } else {
                RectangleBoxComponent()
//            }
        }
        .padding(.leading, 20)
        .padding(.trailing, 20)
        //            .ignoresSafeArea()
    }
}

//#Preview {
//    TaskSubview()
//}
