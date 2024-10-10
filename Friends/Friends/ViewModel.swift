//
//  ViewModel.swift
//  Friends
//
//  Created by Alejandra Coeto on 10/10/24.
//

import Foundation

class ViewModel: ObservableObject {
    @Published var nombre: String = ""
    @Published var amigos = [String]() {
        didSet {
            if let codificado = try? JSONEncoder().encode(amigos) {
                try? codificado.write(to: rutaArchivo())
            }
        }
    }
    
    init() {
        if let datosRecuperados = try? Data.init(contentsOf: rutaArchivo()) {
            if let datosDecodificados = try? JSONDecoder().decode([String].self, from: datosRecuperados) {
                amigos = datosDecodificados
                return
            }
        }
        amigos = []
    }
    
    func addAmigo(_ nombreIn: String) {
        amigos.append(nombreIn)
        nombre = ""
    }
    
    func rutaArchivo() -> URL {
        let url = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
        let pathArchivo = url.appendingPathComponent("Articulos.JSON")
        print(pathArchivo.path())
        return pathArchivo
    }
}
