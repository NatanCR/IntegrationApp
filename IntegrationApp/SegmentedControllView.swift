//
//  SegmentedControllView.swift
//  IntegrationApp
//
//  Created by Barbara Argolo on 07/11/23.
//

import SwiftUI

extension String: Identifiable {
    public var id: String { self }
}

struct SegmentControlView<ID: Identifiable, Content: View, Background: Shape>: View {
    let segments: [ID]
    @Binding var selected: ID
    var titleNormalColor: Color
    var titleSelectedColor: Color
    var selectedColor: Color
    var defaultColor: Color
    let animation: Animation
    @ViewBuilder var content: (ID) -> Content
    @ViewBuilder var background: () -> Background
    
    @Namespace private var namespace
    
    var body: some View {
        GeometryReader { bounds in
            HStack(spacing: 0) {
                ForEach(segments) { segment in
                    NewSegmentButtonView(id: segment,
                                         selectedId: $selected,
                                         titleNormalColor: titleNormalColor,
                                         titleSelectedColor: titleSelectedColor,
                                         selectedColor: selectedColor,
                                         defaultColor: defaultColor,
                                         animation: animation,
                                         namespace: namespace) {
                        content(segment)
                    } background: {
                        background()
                    }
                    .frame(width: bounds.size.width / CGFloat(segments.count))
                }
            }
            .background {
                background()
                    .fill(defaultColor)
                    .overlay(
                        background()
                            .foregroundColor(selectedColor.opacity(0.2))
                        
                    )
            }
        }
    }
}

struct NewSegmentButtonView<ID: Identifiable, Content: View, Background: Shape>: View {
    let id: ID
    @Binding var selectedId: ID
    var titleNormalColor: Color
    var titleSelectedColor: Color
    var selectedColor: Color
    var defaultColor: Color
    var animation: Animation
    var namespace: Namespace.ID
    @ViewBuilder var content: () -> Content
    @ViewBuilder var background: () -> Background
    
    
    var body: some View {
        GeometryReader { bounds in
            Button {
                withAnimation(animation) {
                    selectedId = id
                }
            } label: {
                content()
            }
            .frame(width: bounds.size.width, height: bounds.size.height)
            .scaleEffect(selectedId.id == id.id ? 1 : 0.8)
            .clipShape(background())
            .foregroundColor(selectedId.id == id.id ? titleSelectedColor : titleNormalColor)
            .background(buttonBackground)
        }
    }
    
    @ViewBuilder private var buttonBackground: some View {
        if selectedId.id == id.id {
            background()
                .fill(selectedColor)
                .matchedGeometryEffect(id: "SelectedTab", in: namespace)
        } 
    }
}

