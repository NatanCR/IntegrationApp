//
//  SegControlComponent.swift
//  IntegrationApp
//
//  Created by Barbara Argolo on 06/11/23.
//

import SwiftUI

struct SegControlComponent: View {
    var task = EventTask()
    var finance = Finance()
    var quiz = Quiz()
    
    init(task: EventTask = EventTask(), finance: Finance = Finance(), quiz: Quiz = Quiz()) {
        self.task = task
        self.finance = finance
        self.quiz = quiz
    }
    
    @State var initialProperty = "Tarefa"
    var eventsProperty = ["Tarefa", "Enquetes", "Financeiro"]
    
    
    var body: some View {
            ZStack {
                Color(.systemBlue)
        
                Picker("Propriedades do Evento", selection: $initialProperty) {
                    ForEach(eventsProperty, id: \.self) { prop in
                        Text(prop)
                    }
                }.pickerStyle(.segmented)
        }.ignoresSafeArea()
            .frame(width: 358, height: 55)
    }
}

#Preview {
    SegControlComponent()
}
