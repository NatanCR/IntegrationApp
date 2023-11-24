//
//  FinanceSubview.swift
//  IntegrationApp
//
//  Created by Barbara Argolo on 07/11/23.
//

import SwiftUI

struct FinanceSubview: View {
    @Environment (\.screenSize) var screenSize
    var body: some View {
        VStack {
            CreateEventButton(view: SheetCreateFinance())
                .position(CGPoint(x: screenSize.width * 0.88, y: screenSize.height * 0.78))
        }
    }
}

#Preview {
    FinanceSubview()
}
