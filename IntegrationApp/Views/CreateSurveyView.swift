//
//  SurveyView.swift
//  IntegrationApp
//
//  Created by Guilherme Borges on 16/11/23.
//

import SwiftUI

// Definição da view para exibir uma enquete

struct CreateSurveyView: View {
    @Binding var title: String
    @State private var showingResults = false
    @State private var newOption = ""
    @State private var options: [SurveyOption] = [
        SurveyOption(id: 1, name: "Vermelho", votes: 0),
        SurveyOption(id: 2, name: "Azul", votes: 0),
        SurveyOption(id: 3, name: "Verde", votes: 0)
    ]

    var body: some View {
        
        VStack(alignment: .leading, spacing: 10) {
            SurveyComponent(
                question: "Qual é a sua cor favorita?",
                options: $options,
                isVotingEnabled: true
            )

            TextField("Toque para adicionar", text: $newOption, onCommit: {
                if !newOption.isEmpty {
                    let newId = options.count + 1
                    options.append(SurveyOption(id: newId, name: newOption, votes: 0))
                    newOption = ""
                }
            })
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding()

            Button("Show Results") {
                showingResults.toggle()
            }
            .sheet(isPresented: $showingResults) {
//                VStack{
//                    TextFieldComponent(text: $title, placeholder: "Digite o nome da enquete...")
//                        .foregroundColor(Color("TextFieldColor"))
//                }
                Form {
                    Section(header: Text("Título").bold().foregroundColor(.black)){
                        TextFieldComponent(text: $title, placeholder: "Digite o nome da enquete...")
                            .foregroundColor(Color("TextFieldColor"))
                    }.listRowBackground(Color.clear)
                    
                }
//                SurveyComponent(
//                    question: "Qual é a sua cor favorita?",
//                    options: $options,
//                    isVotingEnabled: false
//                )
            }
        }
        .padding()
    }
}



//// Definição da classe para representar uma enquete observável
//class Poll: ObservableObject {
//    @Published var question: String
//    @Published var options: [SurveyOption]
//
//    // Inicialização da enquete com uma pergunta e uma lista de opções
//    init(question: String, options: [SurveyOption]) {
//        self.question = question
//        self.options = options
//    }
//
//    // Método para registrar um voto em uma opção específica
//    func vote(optionId: Int) {
//        if let index = options.firstIndex(where: { $0.id == optionId }) {
//            options[index].votes += 1
//        }
//    }
//}
