//
//  LowerViewModel.swift
//  EvaluacionFinal
//
//  Created by Alejandra Coeto on 28/11/24.
//

import Foundation

class LowerViewModel: ObservableObject {
    @Published var value: Float = 0.0
    @Published var isSheetOpen: Bool = false
    
    func openSheet() {
        isSheetOpen = true
    }
    
}
