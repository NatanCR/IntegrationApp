//
//  ObjectViewModel.swift
//  IntegrationApp
//
//  Created by Natan de Camargo Rodrigues on 27/11/23.
//

import Foundation

class ObjectViewModel: ObservableObject {
    @Published var dataAPIResponse = APIRequestVM()
}
