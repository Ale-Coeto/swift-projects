//
//  PruebasUnitariasTests.swift
//  PruebasUnitariasTests
//
//  Created by Alejandra Coeto on 07/11/24.
//

import XCTest
@testable import PruebasUnitarias

final class PruebasUnitariasTests: XCTestCase {
    var sut : CtaBanc!
    
    override func setUpWithError() throws {
        sut = CtaBanc(nombre: "Juan", saldo: 1000)
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func testDeposita() throws {
        sut.deposita(cantidad: 100)
        XCTAssertEqual(sut.saldo, 1100)
    }

    func testRetira() throws {
        let ans = sut.retira(cantidad: 100)
        XCTAssertEqual(sut.saldo, 900)
        XCTAssertTrue(ans)
    }
    
    func testRetiraConError() throws {
        let ans = sut.retira(cantidad: 1200)
        XCTAssertEqual(sut.saldo, 1000)
        XCTAssertFalse(ans)
    }
    
    
    func testInit() throws {
        XCTAssertEqual(sut.nombre, "Juan")
        XCTAssertEqual(sut.saldo, 1000)
    }

}
