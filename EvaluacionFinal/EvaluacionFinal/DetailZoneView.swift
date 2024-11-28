//
//  DetailZoneView.swift
//  EvaluacionFinal
//
//  Created by Alejandra Coeto on 28/11/24.
//

import SwiftUI

struct DetailZoneView: View {
    var zona: Zona
    
    var body: some View {
        ZStack {
            Color(zona.color)
            VStack {
                Text(zona.nombre)
                    .font(.title2)
                    .fontWeight(.bold)
                
                Text(zona.descripcion)
                    .padding()
                    .background(.white)
            }
            .padding()
        }
        .ignoresSafeArea()
    }
}

#Preview {
    DetailZoneView(zona: Zona(nombre: "aa", color: Color(red: 192/255, green: 214/255, blue: 0/255), descripcion: "hola"))
}
