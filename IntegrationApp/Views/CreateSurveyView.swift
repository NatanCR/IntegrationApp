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
    
    //    // Estado para armazenar as opções da enquete
    @State private var options: [QuizAnswer] = []
    
    var cornerRadius: CGFloat = 15
    @ObservedObject var objectVM: APIRequestVM
    
    @Environment (\.screenSize) var screenSize
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            if objectVM.currentEvent.currentEvent?.quiz?.count == 0 {
                VStack(alignment: .center) {
                    Text("Nenhuma enquete criada...")
                        .font(.custom("Poppins-Regular", size: 15))
                        .foregroundStyle(Color.blueText)
                    Image(.imagemEnquete)
                        .resizable()
                        .scaledToFit()
                }
                Spacer()
                HStack {
                    Spacer()
                    CreateEventButton(view: SheetSurveyView())
                        .padding(.trailing, 10)
                }
            } else {
                // Botão para mostrar os resultados da enquete
            }
            
            SurveyResultsView(options: $options)
        }
        .padding()
    }
}
