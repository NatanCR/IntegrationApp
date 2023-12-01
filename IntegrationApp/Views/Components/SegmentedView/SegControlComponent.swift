//
//  SegControlComponent.swift
//  IntegrationApp
//
//  Created by Barbara Argolo on 06/11/23.
//

import SwiftUI

struct SegControlComponent: View {
    @State var initialProperty = "Tarefa"
    @State private var eventsProperty = ["Tarefa", "Enquetes", "Financeiro"]
    
    @ObservedObject var objectVM: APIRequestVM
    
    init(objectVM: APIRequestVM) {
        if let selectedSegmentColor = UIColor(named: "SegmentedControlSelected") {
            UISegmentedControl.appearance().selectedSegmentTintColor = selectedSegmentColor
        }
        self.objectVM = objectVM
    }
    
    var body: some View {
        ZStack {
            VStack {
                SegmentControlView(segments: eventsProperty,
                                   selected: $initialProperty,
                                   titleNormalColor: .white,
                                   titleSelectedColor: .white,
                                   selectedColor: .segmentedControlSelected, 
                                   defaultColor: .segmentedControlNotSelected,
                                   animation: Animation.default) { property in
                    Text(property)
                        .font(.system(size: 16, weight: .semibold, design: .rounded))
                        .padding(.horizontal)
                        .padding(.vertical, 8)
                } background: {
                    RoundedRectangle(cornerRadius: 15, style: .circular)
                }
                .padding(.leading, 20)
                .padding(.trailing, 20)
                .frame(height: 55)
                .padding(.top, 20)
            
                ScrollViewComponent(selection: initialProperty, objectVM: objectVM)
            }
        }
        .ignoresSafeArea()
        .padding(.top, 110)
        
    }
}

//#Preview {
//    SegControlComponent()
//}
