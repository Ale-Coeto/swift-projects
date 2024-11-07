//
//  CtaBanc.swift
//  pruebasUnitariasSwiftUIFJ23
//
//  Created by Yolanda Martínez Treviño on 30/05/23.
//

import Foundation

class CtaBanc : NSObject {
    var nombre : String
    var saldo : Double
    
    init(nombre: String, saldo: Double) {
        self.nombre = nombre
        self.saldo = saldo
    }
    
    func deposita(cantidad : Double) {
        saldo += cantidad
    }
    
    func retira(cantidad: Double) -> Bool {
        guard saldo >= cantidad else {return false}
        saldo -= cantidad
        return true
    }
}

