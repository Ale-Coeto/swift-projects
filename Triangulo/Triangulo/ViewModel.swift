//
//  ViewModel.swift
//  Triangulo
//
//  Created by Alejandra Coeto on 24/09/24.
//

import Foundation

class ViewModel: ObservableObject {
    @Published var triangle: Triangle
    @Published var sideX: String = ""
    @Published var sideY: String = ""
    @Published var sideZ: String = ""
    @Published var area: String = ""
    @Published var tipo: String = ""
    @Published var showAlert: Bool = false

    @Published var p1: CGPoint = CGPoint(x: 0, y: 0)
    @Published var p2: CGPoint = CGPoint(x: 0, y: 0)
    @Published var p3: CGPoint = CGPoint(x: 0, y: 0)
    
    let invalid_message = "Triángulo no válido"
    
    
    init() {
        triangle = Triangle(x: 1, y: 1, z: 1)
    }
    
    private func normalize(side: Float, longestSide: Float) -> Float{
        return (side * 200 / longestSide)
    }
    
    func setSides() {
        if let xFloat = Float(sideX), let yFloat = Float(sideY), let zFloat = Float(sideZ) {
            triangle.x = xFloat
            triangle.y = yFloat
            triangle.z = zFloat
            area = triangle.isValidTriangle() ? String(triangle.area) : invalid_message
            tipo = triangle.isValidTriangle() ? triangle.typeOfTriangle : invalid_message
            showAlert = !triangle.isValidTriangle()
            
            if (!showAlert) {
                var longestSide : Float
                var secondSide : Float
                var thirdSide : Float
                
                if (triangle.x > triangle.y && triangle.x > triangle.z) {
                    longestSide = triangle.x
                    secondSide = triangle.y
                    thirdSide = triangle.z
                } else if (triangle.y > triangle.z){
                    longestSide = triangle.y
                    secondSide = triangle.x
                    thirdSide = triangle.z
                } else {
                    longestSide = triangle.z
                    secondSide = triangle.x
                    thirdSide = triangle.y
                }
                
                
                secondSide = normalize(side: secondSide, longestSide: longestSide)
                thirdSide = normalize(side: thirdSide, longestSide: longestSide)
                longestSide = normalize(side: longestSide, longestSide: longestSide)

                let area = Triangle.getArea(x1: longestSide, y1: secondSide, z1: thirdSide)
                let h = 2 * area/longestSide

                var xc = (pow(longestSide, 2) + pow(secondSide, 2) - pow(thirdSide, 2))
                xc /= (2*longestSide)

                p1 = CGPoint(x: 0, y: 200)
                p2 = CGPoint(x: Int(longestSide), y: 200)
                p3 = CGPoint(x: Int(xc), y: 200 - Int(h))
                
            } else {
                resetPoints()
            }
        } else {
            area = invalid_message
            tipo = invalid_message
            showAlert = true
        }
    }
    
    func resetPoints() {
        p1 = CGPoint(x: 0, y: 0)
        p2 = CGPoint(x: 0, y: 0)
        p3 = CGPoint(x: 0, y: 0)
    }
    func getTriangleArea() -> String {
        return String(triangle.area)
    }
    
}
