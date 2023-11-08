//
//  TaskSubview.swift
//  IntegrationApp
//
//  Created by Barbara Argolo on 07/11/23.
//

import SwiftUI

struct TaskSubview: View {
    var body: some View {
        ZStack {
            //Color(.systemCyan)
            Text("TASK Subview")
            RectangleBoxComponent()
        }.padding(.leading, 20)
            .padding(.trailing, 20)
            .ignoresSafeArea()
    }
}

#Preview {
    TaskSubview()
}
