//
//  pruebasUIUITests.swift
//  pruebasUIUITests
//
//  Created by Alejandra Coeto on 12/11/24.
//

import XCTest

final class pruebasUIUITests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false


    }

    @MainActor
    func testColor() throws {
        let app = XCUIApplication()
        app.launch()
        
        let opcionRojo = app.segmentedControls.buttons["Rojo"]
        let opcionAzul = app.segmentedControls.buttons["Azul"]
        
        opcionRojo.tap()
        var mensaje = app.staticTexts["ColorText"]
        XCTAssertEqual(mensaje.label, "Rojo")
        
        opcionAzul.tap()
        mensaje = app.staticTexts["ColorText"]
        XCTAssertTrue(mensaje.label == "Azul")
        
    }
    
    func testLoginSuccess() throws {
        let app = XCUIApplication()
        app.launch()
        
        let userTextField = app.textFields["UserTextField"]
        let passwordTextField = app.textFields["PasswordTextField"]
        let loginButton = app.buttons["LoginButton"]
        
        userTextField.tap()
        userTextField.typeText("Susana")
        
        passwordTextField.tap()
        passwordTextField.typeText("1234")
        
        loginButton.tap()
        
        let adentroApp = app.staticTexts["AdentroApp"]
        XCTAssertTrue(adentroApp.exists)
    }
    
    func testLoginFailure() throws {
        let app = XCUIApplication()
        app.launch()
        
        let userTextField = app.textFields["UserTextField"]
        let passwordTextField = app.textFields["PasswordTextField"]
        let loginButton = app.buttons["LoginButton"]
        
        userTextField.tap()
        userTextField.typeText("Susana")
        
        passwordTextField.tap()
        passwordTextField.typeText("12")
        
        loginButton.tap()
        
        let adentroApp = app.staticTexts["AdentroApp"]
        XCTAssertFalse(adentroApp.exists)
    }

}


