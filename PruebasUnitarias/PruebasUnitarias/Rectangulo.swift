//
//  Rectangulo.swift
//  PruebasUnitarias
//
//  Created by Alejandra Coeto on 07/11/24.
//

import Foundation

struct Punto {
    var x: Double
    var y: Double
}

class Rectangulo: NSObject {
    var esquina1: Punto
    var esquina2: Punto
    
    // Crea un objeto rectángulo dadas dos esquinas opuestas
    init(esquina1: Punto, esquina2: Punto) {
        self.esquina1 = esquina1
        self.esquina2 = esquina2
    }
    
    var largo: Double {
        return abs(esquina2.x - esquina1.x)
    }
    
    var ancho: Double {
        return abs(esquina2.y - esquina1.y)
    }
    
    func area() -> Double {
        return largo * ancho
    }
    
    func perimetro() -> Double {
        return 2 * (largo + ancho)
    }
    
    // regresa true si el punto se encuentra dentro del rectángulo
    // false en caso contrario
    // se considera dentro si está sobre la línea
    func contienePunto(x: Double, y: Double) -> Bool {
        let minX = min(esquina1.x, esquina2.x)
        let maxX = max(esquina1.x, esquina2.x)
        let minY = min(esquina1.y, esquina2.y)
        let maxY = max(esquina1.y, esquina2.y)
        return x >= minX && x <= maxX && y >= minY && y <= maxY
    }
}
