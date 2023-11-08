//
//  SheetComponent.swift
//  IntegrationApp
//
//  Created by Guilherme Borges on 06/11/23.
//

import SwiftUI

struct SheetComponent: View {
    @Binding var isSheetPresented: Bool
    
    var body: some View {
        VStack {
            Text("Conteúdo da Sheet")
            Button("Fechar") {
                isSheetPresented.toggle()
            }
        }
        .padding()
    }
}

//#Preview {
//    SheetComponent(isSheetPresented: <#Binding<Bool>#>)
//}
