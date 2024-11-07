//
//  PruebasUnitariasTests.swift
//  PruebasUnitariasTests
//
//  Created by Alejandra Coeto on 07/11/24.
//

import XCTest
@testable import PruebasUnitarias

final class RectanguloTests: XCTestCase {
    var sut : Rectangulo! //Software under test
    
    override func setUpWithError() throws {
        sut = Rectangulo(esquina1: Punto(x: 1, y: 2), esquina2: Punto(x: 4, y: 6))
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func testInit() {
        XCTAssertEqual(sut.esquina1.x, 1)
        XCTAssertEqual(sut.esquina1.y, 2)
        XCTAssertEqual(sut.esquina2.x, 4)
        XCTAssertEqual(sut.esquina2.y, 6)
        XCTAssertEqual(sut.largo, 3)
        XCTAssertEqual(sut.ancho, 4)
    }
    
    func testArea() {
        let area = sut.area()
        XCTAssertEqual(area, 12)
    }
    
    func testPerimetro() {
        let perimetro = sut.perimetro()
        XCTAssertEqual(perimetro, 14)
    }
    
    func testContienePuntoTrue() {
        XCTAssertTrue(sut.contienePunto(x: 3, y: 3))
    }
    
    func testContienePuntoFalseIzq() {
        XCTAssertFalse(sut.contienePunto(x: 0, y: 3))
    }
    
    func testContienePuntoFalseDer() {
        XCTAssertFalse(sut.contienePunto(x: 5, y: 3))
    }
    
    func testContienePuntoFalseArr() {
        XCTAssertFalse(sut.contienePunto(x: 3, y: 7))
    }
    
    func testContienePuntoFalseAba() {
        XCTAssertFalse(sut.contienePunto(x: 3, y: 0))
    }

}

