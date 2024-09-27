//
//  Triangulo.swift
//  Triangulo
//
//  Created by Alejandra Coeto on 24/09/24.
//

import Foundation


// Clase para representar un triángulo
class Triangle {
    var x: Float
    var y: Float
    var z: Float
    var s: Float = 1
    
    var area : Float {
        get {
            s = (x + y + z)/2
            return sqrtf((s*(s-x)*(s-y)*(s-z)))
        }
    }
    
    var typeOfTriangle : String {
        get {
            if (x == y && x == z && y == z) {
                return "Equilatero"
            } else if (x == y || x == z || y == z) {
                return "Isósceles"
            }
            
            return "Escaleno"
        }
    }
    
    init(x: Float, y: Float, z: Float) {
        self.x = x
        self.y = y
        self.z = z
    }
    
    func isValidTriangle() -> Bool {
        return x > 0 && y > 0 && z > 0 && x + y > z && x + z > y && y + z > x
    }
    
    static func getArea(x1: Float, y1: Float, z1: Float) -> Float {
        let s1 = (x1 + y1 + z1)/2
        let a = s1*(s1-x1)*(s1-y1)*(s1-z1)
        return sqrtf(a)
    }

}
