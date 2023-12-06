//
//  SurveyView.swift
//  IntegrationApp
//
//  Created by Guilherme Borges on 16/11/23.
//

import SwiftUI

struct CreateSurveyView: View {
    //    @State var title: String = ""
    @State private var showingResults = false
        
    var cornerRadius: CGFloat = 15
    @ObservedObject var objectVM: APIRequestVM
    
    @Environment (\.screenSize) var screenSize
    
    var body: some View {
        VStack(alignment: .leading) {
            if objectVM.currentEvent.currentEvent?.quiz?.count == 0 {
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
                // Botão para mostrar os resultados da enquete
            }
        }
    }
}
