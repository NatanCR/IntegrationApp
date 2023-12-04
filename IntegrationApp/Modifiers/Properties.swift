//
//  Properties.swift
//  IntegrationApp
//
//  Created by Natan de Camargo Rodrigues on 04/12/23.
//

import Foundation
import SwiftUI

struct Properties {
    static let shared = Properties()
    
    let gridRowsMembers = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    let gridRowsFinance = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    let gridHeightMembers: CGFloat = 500
    
    let gridHeightFinance: CGFloat = 400
}
