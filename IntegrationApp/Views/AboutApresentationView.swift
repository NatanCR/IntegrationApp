//
//  AboutApresentationView.swift
//  IntegrationApp
//
//  Created by Guilherme Borges on 13/11/23.
//

import SwiftUI

struct AboutApresentationView: View {
    var body: some View {
        HStack {
            Spacer()
            VStack(alignment: .leading, spacing: -2) {
                Spacer()
                TitleComponent(title: "Sobre")
                    .font(.title)
                    .foregroundColor(.segmentedControlSelected)
                    .padding(5)
                Text(" Como objetivo, buscamos auxiliar os\n alunos a organizar pequenos eventos em\n grupo, através de enquetes e\n compartilhamento simultâneo!")
                    .foregroundColor(.segmentedControlSelected)
                Spacer()
//                NavigationLink(destination: AboutApresentationView(), label: {
//                        ColaborateComponent(title: "Próximo")
//                            .foregroundColor(.white)
//                    })
            }
            Spacer()
        }
        .background(Color.apresentationView)
    }
}

#Preview {
    AboutApresentationView()
}
