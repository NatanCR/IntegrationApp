//
//  DatePickerComponent.swift
//  IntegrationApp
//
//  Created by Guilherme Borges on 06/11/23.
//

import SwiftUI

struct DatePickerComponent: View {
    @Binding var selectedDate: Date
    
    var body: some View {
        DatePicker( "", selection: $selectedDate, displayedComponents: .date)
    }
}

//#Preview {
//    DatePickerComponent(selectedDate: )
//}
