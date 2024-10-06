//
//  Jugador.swift
//  Lessons
//
//  Created by Alejandra Coeto on 03/10/24.
//

import Foundation

struct Jugador: Identifiable {
    var id: Int
    var nombre: String
    var puntos: Int
    var email: String
}

extension Jugador {
    static let datosEjemplo = [
        Jugador(id: 1, nombre: "Juan", puntos: 260, email: "idk"),
        Jugador(id: 2, nombre: "Oscar ", puntos: 290, email: "idk"),
        Jugador(id: 3, nombre: "Miguel ", puntos: 290, email: "idk")
    ]
}
