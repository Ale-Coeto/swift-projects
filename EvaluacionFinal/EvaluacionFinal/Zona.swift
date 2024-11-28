//
//  Zona.swift
//  EvaluacionFinal
//
//  Created by Alejandra Coeto on 28/11/24.
//

import Foundation
import SwiftUI

struct Zona : Hashable, Identifiable {
    var id = UUID()
    var nombre: String
    var color : Color
    var descripcion: String
}

extension Zona {
    static let datosEjemplo = [
        Zona(nombre: "Pertenezco", color: Color(red: 192/255, green: 214/255, blue: 0/255), descripcion: "Aprendo sobre la flora y la fauna de Nuevo León y conozco la gran red de vida que nos rodea."),
        Zona(nombre: "Comunico", color: Color(red: 1/255, green: 110/255, blue: 210/255), descripcion: "Comparte tus ideas para mejorar el medio ambiente"),
        Zona(nombre: "Expreso", color: Color(red: 255/255, green: 108/255, blue: 1/255), descripcion: "Refleja tus emociones y sentimientos sobre la naturaleza a través del arte")
    ]
}
