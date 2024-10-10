//
//  ListaArticulos.swift
//  Lessons
//
//  Created by Alejandra Coeto on 08/10/24.
//

import Foundation

class ListaArticulos : ObservableObject {
    @Published var articulos = [Articulo]() {
        didSet {
            if let codificado = try? JSONEncoder().encode(articulos) {
                try? codificado.write(to: rutaArchivo())
            }
        }
        //se ejecuta si se cambia la variable articulos
    }
    
    init() {
        if let datosRecuperados = try? Data.init(contentsOf: rutaArchivo()) {
            if let datosDecodificados = try? JSONDecoder().decode([Articulo].self, from: datosRecuperados) {
                articulos = datosDecodificados
                return
            }
        }
        articulos = []
    }
    //Checa si existen datos para precargarlos
    
    func rutaArchivo() -> URL {
        let url = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
        let pathArchivo = url.appendingPathComponent("Articulos.JSON")
        print(pathArchivo.path())
        return pathArchivo
    }
    
}
