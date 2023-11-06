//
//  SheetCreatEvent.swift
//  IntegrationApp
//
//  Created by Guilherme Borges on 06/11/23.
//

import SwiftUI

struct ScreenEvents: View {
    @State private var isSheetPresented = false
    @State private var title = ""
    @State private var selectedDate = Date()

    var body: some View {
        Button(action: {
            isSheetPresented.toggle()
        }) {
            Text("Abrir Sheet")
        }
        .sheet(isPresented: $isSheetPresented, content: {
            SheetView(title: $title, selectedDate: $selectedDate, isSheetPresented: $isSheetPresented)
//            SheetComponent(isSheetPresented: $isSheetPresented)
        })
    }
}


