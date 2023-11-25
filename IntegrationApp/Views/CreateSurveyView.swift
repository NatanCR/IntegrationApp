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
    @State private var selectedSegment1 = 0
    @State private var selectedSegment2 = 0
    @State private var options: [SurveyOption] = [
        SurveyOption(id: 1, name: "Vermelho", votes: 0),
        SurveyOption(id: 2, name: "Azul", votes: 0),
        SurveyOption(id: 3, name: "Verde", votes: 0)
    ]
    @Environment (\.screenSize) var screenSize
    
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
                NavigationStack {
                    VStack(alignment: .leading) {
                        Section(header: TitleComponent(title: "Título")) {
                            TextFieldComponent(text: $title, placeholder: "Digite o nome da enquete...")
                                .foregroundColor(Color("TextFieldColor"))
                        }.listRowBackground(Color.clear)
                        Section(header: TitleComponent(title: "Prazo Final")) {
                            TextFieldComponent(text: $title, placeholder: "Digite o nome da enquete...")
                                .foregroundColor(Color("TextFieldColor"))
                        }.listRowBackground(Color.clear)
                    }
                    VStack(alignment: .leading, spacing: 15){
                        Section(header: TitleComponent(title: "Tipo de Enquete")){
                            Picker("Segmento", selection: $selectedSegment1) {
                                Text("Opção 1").tag(0)
                                Text("Opção 2").tag(1)
                            }
                            .pickerStyle(SegmentedPickerStyle())
                            .frame(width: screenSize.width * 0.9)
                            
                            TitleComponent(title: "Tipo de Escolha")
                            Picker("Segmento", selection: $selectedSegment2) {
                                Text("Opção 1").tag(0)
                                Text("Opção 2").tag(1)
                            }
                            .pickerStyle(SegmentedPickerStyle())
                            .frame(width: screenSize.width * 0.9)
                        }
                    }
                    
                    VStack(alignment: .leading){
                        Section(header: TitleComponent(title: "Opções")){
                            
                        }
                    }

                    Spacer()
                        .navigationBarTitle("Criar Enquete", displayMode: .inline)
                        .navigationBarItems(
                            leading: Button("Cancelar") {
                                showingResults = false
                            },
                            trailing: Button("Criar") {
                                showingResults = false
                            }
                        )
                }
            }
            
        }
        .padding()
    }
}



//    .sheet(isPresented: $showingResults) {
//        NavigationStack{
//            VStack(alignment: .leading) {
//                Section(header: Text("Título").bold().foregroundColor(.black)){
//                    TextFieldComponent(text: $title, placeholder: "Digite o nome da enquete...")
//                        .foregroundColor(Color("TextFieldColor"))
//                }.listRowBackground(Color.clear)
//                Section(header: Text("Título").bold().foregroundColor(.black)){
//                    TextFieldComponent(text: $title, placeholder: "Digite o nome da enquete...")
//                        .foregroundColor(Color("TextFieldColor"))
//                }.listRowBackground(Color.clear)
//                Spacer()
//            }
//
//            //                SurveyComponent(
//            //                    question: "Qual é a sua cor favorita?",
//            //                    options: $options,
//            //                    isVotingEnabled: false
//            //                )
//        }
//
//
//    }
////// Definição da classe para representar uma enquete observável
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
