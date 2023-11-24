//
//  SheetCreateFinance.swift
//  IntegrationApp
//
//  Created by Natan de Camargo Rodrigues on 23/11/23.
//

import SwiftUI

struct SheetCreateFinance: View {
    
    
    var body: some View {
        NavigationStack {
            SheetCreateEvent(closeAndDisplayEventView: {}, placeholderText: "Digite o nome do débito...", sheetBarTitle: "Criar Débito", isFinanceSheetView: true)
        }
    }
}

#Preview {
    SheetCreateFinance()
}
