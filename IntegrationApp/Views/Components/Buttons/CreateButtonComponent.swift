//
//  CreateButtonComponent.swift
//  IntegrationApp
//
//  Created by Barbara Argolo on 06/11/23.
//

import SwiftUI

struct CreateButtonComponent: View {
    @State private var isSheetPresented = false
    @State private var title = ""
    @State private var selectedDate = Date()

    var body: some View {
        ZStack {
            Button {
                isSheetPresented.toggle()
                print("Adicionar ainda")
                
            } label: {
                Image(systemName: "plus")
                    .foregroundStyle(.white)
                    .font(.system(size: 20))
                    .fontWeight(.bold)
                    .padding()
                    .background(
                        Circle()
                            .fill(.orangeDetails)
                    )
            }.sheet(isPresented: $isSheetPresented, content: {
                SheetCreateEvent(title: $title, selectedDate: $selectedDate, isSheetPresented: $isSheetPresented)
            })
            .frame(width: 50, height: 50)
        }
        .frame(width: 300, height: 700, alignment: .bottomTrailing)
    }
}

#Preview {
    CreateButtonComponent()
}
