//
//  SurveyView.swift
//  IntegrationApp
//
//  Created by Guilherme Borges on 16/11/23.
//

import SwiftUI

struct CreateSurveyView: View {
    @Binding var title: String
    @State private var showingResults = false

    // Estado para armazenar uma nova opção de enquete
    @State private var newOption = ""

    // Estados para armazenar a seleção atual em segmentos de controle
    @State private var selectedSegment1 = 0
    @State private var selectedSegment2 = 0

    // Estado para armazenar as opções da enquete
    @State private var options: [SurveyOption] = []

    // Estados para propriedades iniciais de segmentos de controle
    @State var initialProperty1 = "Atividades"
    @State var initialProperty2 = "Única"

    // Arrays para as opções dos segmentos de controle
    @State private var eventsProperty1 = ["Atividades", "Financeiro"]
    @State private var eventsProperty2 = ["Única", "Múltipla"]

    var cornerRadius: CGFloat = 15

    @Environment (\.screenSize) var screenSize
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            // Botão para mostrar os resultados da enquete
            Button("Show Results") {
                showingResults.toggle()
            }
            // sheet
            .sheet(isPresented: $showingResults) {
                NavigationStack {
                    ScrollView {
                        VStack(alignment: .leading) {
                            // Campo título
                            Section(header: TitleComponent(title: "Título")) {
                                TextFieldComponent(text: $title, placeholder: "Digite o nome da enquete...")
                                    .foregroundColor(Color("TextFieldColor"))
                            }.listRowBackground(Color.clear)
                            
                            // Campo prazo
                            Section(header: TitleComponent(title: "Prazo Final")) {
                                TextFieldComponent(text: $title, placeholder: "Digite o nome da enquete...")
                                    .foregroundColor(Color("TextFieldColor"))
                            }.listRowBackground(Color.clear)
                        }
                        
                        VStack(alignment: .leading, spacing: 15) {
                            //escolher o tipo de enquete(Segment que peguei da barbaresca)
                            Section(header: TitleComponent(title: "Tipo de Enquete")) {
                                // Controle de segmento para selecionar o tipo de enquete
                                SegmentControlView(segments: eventsProperty1,
                                                   selected: $initialProperty1,
                                                   titleNormalColor: .white,
                                                   titleSelectedColor: .white,
                                                   selectedColor: .segmentedControlSelected,
                                                   defaultColor: .segmentedSurvey,
                                                   animation: Animation.default) { property in
                                    Text(property)
                                        .font(.system(size: 16, weight: .semibold, design: .rounded))
                                        .padding(.horizontal)
                                        .padding(.vertical, 8)
                                } background: {
                                    RoundedRectangle(cornerRadius: cornerRadius, style: .circular)
                                }
                                .padding(.leading, 20)
                                .padding(.trailing, 20)
                                .frame(height: 55)
                                .padding(.top, 20)
                                
                                
                                TitleComponent(title: "Tipo de Escolha")
                                
                                // Controle de segmento para o tipo de escolha
                                VStack(alignment: .leading) {
                                    SegmentControlView(segments: eventsProperty2,
                                                       selected: $initialProperty2,
                                                       titleNormalColor: .white,
                                                       titleSelectedColor: .white,
                                                       selectedColor: .segmentedControlSelected,
                                                       defaultColor: .segmentedSurvey,
                                                       animation: Animation.default) { property in
                                        Text(property)
                                            .font(.system(size: 16, weight: .semibold, design: .rounded))
                                            .padding(.horizontal)
                                            .padding(.vertical, 8)
                                    } background: {
                                        RoundedRectangle(cornerRadius: cornerRadius, style: .circular)
                                    }
                                    .padding(.leading, 20)
                                    .padding(.trailing, 20)
                                    .frame(height: 55)
                                    .padding(.top, 20)
                                }
                            }
                        }
                        
                        // Chamando enquete
                        VStack(alignment: .leading, spacing: 15){
                            Section(header: TitleComponent(title: "Opções")){
                                SurveyComponent(
                                    isVotingEnabled: false, options: $options
                                )
                                .cornerRadius(10)
                            }
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
