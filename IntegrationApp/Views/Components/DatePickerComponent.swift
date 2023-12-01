//
//  DatePickerComponent.swift
//  IntegrationApp
//
//  Created by Guilherme Borges on 06/11/23.
//

import SwiftUI

struct DatePickerComponent: View {
    @Binding var selectedDate: Date
    @Environment (\.screenSize) var screenSize
    
    var body: some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 15)
                .fill(Color.primaryBlue)
                .frame(width: screenSize.width * 0.9, height: screenSize.height * 0.07)
            
            DatePicker("", selection: $selectedDate, displayedComponents: .date)
                    .labelsHidden()
                    .background(Color.clear)
            
        }
        
    }
}

//#Preview {
//    DatePickerComponent(selectedDate: )
//}
