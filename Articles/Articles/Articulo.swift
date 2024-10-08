//
//  Articulo.swift
//  Lessons
//
//  Created by Alejandra Coeto on 08/10/24.
//

import Foundation

struct Articulo: Identifiable {
    var id = UUID()
    var nombre : String
    var precio : Float
    var cantExist : Int
}
