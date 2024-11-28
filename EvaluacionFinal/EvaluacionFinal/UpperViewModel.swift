//
//  UpperViewModel.swift
//  EvaluacionFinal
//
//  Created by Alejandra Coeto on 28/11/24.
//

import Foundation
import SwiftUI

class UpperViewModel: ObservableObject {
    @Published var zonas: [Zona] = Zona.datosEjemplo
    @Published var isSheetOpen: Bool = false
    
    
    func openSheet() {
        isSheetOpen = true
    }
    
    func addZona(nombre: String, descripcion: String) {
        let nuevaZona = Zona(nombre: nombre, color: .red, descripcion: descripcion)
        zonas.append(nuevaZona)
    }
    

    
}
