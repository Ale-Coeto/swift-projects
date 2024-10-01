//
//  ContentView.swift
//  Binding
//
//  Created by Alejandra Coeto on 24/09/24.
//

import SwiftUI

struct BindingView: View {
    @State private var intercambiaColor = true
    
    var body: some View {
        VStack {
            Text("Holaa")
                .foregroundStyle(intercambiaColor ? .green : .red)
            Boton(intercambiarValor: $intercambiaColor, textoBoton: "Intercambia")
        }
    }
}

struct Boton : View {
    @Binding var intercambiarValor : Bool
    var textoBoton = "Hola"
    
    var body: some View {
        Button(textoBoton) {
            intercambiarValor.toggle()
        }
        .font(.title3)
        .padding()
        .background(.blue)
        .clipShape(.rect(cornerRadius: 10))
        .foregroundStyle(.white)
        
    }
}

#Preview {
    BindingView()
}

