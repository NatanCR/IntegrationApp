//
//  FinanceSubview.swift
//  IntegrationApp
//
//  Created by Barbara Argolo on 07/11/23.
//

import SwiftUI

struct FinanceSubview: View {
    var body: some View {
        ZStack {
            Color(.systemYellow)
            Text("Finance Subview")
        }
        .padding(.leading, 20)
        .padding(.trailing, 20)
        .ignoresSafeArea()
    }
}

#Preview {
    FinanceSubview()
}
