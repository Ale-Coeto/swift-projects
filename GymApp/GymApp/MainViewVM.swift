//
//  MainViewVM.swift
//  GymApp
//
//  Created by Alejandra Coeto on 07/10/24.
//

import Foundation
import SwiftUI

class MainViewVM: ObservableObject {
    @Published var nombre = ""
    @Published var fechaNacimiento = Date()
    @Published var aparato = ""
    @Published var duracion = 5.0
    @Published var intensidad = ""
    
    var aparatos = ["", "Caminadora", "Elíptica", "Bicicleta estacionaria", "Máquina de Remo", "Escaladora"]
    var intensidades = ["Calentar", "Quema grasa", "Aeróbico"]
    var rangos = ["Calentar": 0.5, "Quema grasa": 0.6, "Aeróbico": 0.7]
    var colores = ["Calentar": Color(.green), "Quema grasa": Color(.yellow), "Aeróbico": Color(.red)]
    
    var edad: Int  {
        let dateDifference = Calendar.current.dateComponents([.year], from: fechaNacimiento, to: Date.now)
                        
        if let edadCalculada = dateDifference.year {
            return edadCalculada
        } else {
            return 0
        }
    }
    
    
    
    var intensidadMin: Double {
        get {
            (Double(220 - edad) * (rangos[intensidad] ?? 0))
        }
    }
    
    var intensidadMax: Double {
        get {
            (Double(220 - edad) * ((rangos[intensidad] ?? 0) + 0.1))
        }
    }
}
