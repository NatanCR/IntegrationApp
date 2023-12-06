//
//  SurveyView.swift
//  IntegrationApp
//
//  Created by Guilherme Borges on 16/11/23.
//

import SwiftUI

struct CreateSurveyView: View {
    @State var title: String = ""
    @State private var showingResults = false
    @State var selectedDate = Date()
    // Estado para armazenar uma nova opção de enquete
    @State private var newOption = ""

    // Estados para armazenar a seleção atual em segmentos de controle
    @State private var selectedSegment1 = 0
    @State private var selectedSegment2 = 0

    // Estado para armazenar as opções da enquete
    @State private var options: [QuizAnswer] = []

    // Estados para propriedades iniciais de segmentos de controle
    @State var initialProperty1 = "Atividades"
    @State var initialProperty2 = "Única"

    // Arrays para as opções dos segmentos de controle
    @State private var eventsProperty1 = ["Atividades", "Financeiro"]
    @State private var eventsProperty2 = ["Única", "Múltipla"]

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
            } else {
                // Botão para mostrar os resultados da enquete
                Button("Show Results") {
                    showingResults.toggle()
                }
            }
            
            SurveyResultsView(options: $options)
            // sheet
            .sheet(isPresented: $showingResults) {
                NavigationStack {
                    ScrollView {
                        VStack(alignment: .leading) {
                            // Campo título
                            Section(header: TitleComponent(title: "Título")) {
                                TextFieldComponent(valueText: $title, placeholder: "Digite o nome da enquete...")
                                    .foregroundColor(Color("TextFieldColor"))
                            }.listRowBackground(Color.clear)
                            
                            // Campo prazo
                            Section {
                                DatePickerComponent(selectedDate: $selectedDate)
                            } header: {
                                Text("Data do Evento").bold().foregroundStyle(Color.black)
                            }                        }
                        
                        VStack(alignment: .leading, spacing: 15) {
                            //escolher o tipo de enquete(Segment que peguei da barbaresca)
                            Section(header: TitleComponent(title: "Tipo de Enquete").padding(.leading, 20)) {
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
                                
                                // Controle de segmento para o tipo de escolha
                                VStack(alignment: .leading,  spacing: 15) {
                              Section(header: TitleComponent(title: "Tipo de Escolha").padding(.leading, 20)) {
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
                                }
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
                        VStack(alignment: .leading){
                            GridIconComponent()
                        }
                    }.background(Color.apresentationView)
                    
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
