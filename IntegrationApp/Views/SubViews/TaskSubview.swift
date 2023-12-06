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
            if objectVM.currentEvent.currentEvent?.task?.count == 0 {
                VStack(alignment: .center) {
                    Text("Nenhuma enquete criada...")
                        .font(.custom("Poppins-Regular", size: 15))
                        .foregroundStyle(Color.blueText)
                    Image(.imagemEnquete)
                        .resizable()
                        .scaledToFit()
                }
                
                HStack {
                    Spacer()
                    CreateEventButton(view: SheetSurveyView())
                        .padding(.trailing, 10)
                }
                .padding(.top, 65)
            } else {
                RectangleBoxComponent()
            }
        }
    }
}

//#Preview {
//    TaskSubview()
//}
