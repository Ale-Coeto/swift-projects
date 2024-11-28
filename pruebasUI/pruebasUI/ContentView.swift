//
//  ContentView.swift
//  pruebasUI
//
//  Created by Alejandra Coeto on 12/11/24.
//

import SwiftUI

struct ContentView: View {
    var colores = ["Rojo", "Azul"]
    @State var colorElegido : String = ""
    @State var usuario : String = ""
    @State var contrasena : String = ""
    @State var entrar = false
    @State var mensaje : String = ""
    var usuarioActual = "Susana"
    var contrasenaActual = "1234"
    
    var body: some View {
        VStack {
            Picker("Elige un color", selection: $colorElegido) {
                ForEach(colores, id: \.self) { color in
                    Text(color)
                }
            }
        }
        .pickerStyle(.segmented)
        .padding()
        
        VStack {
            Text(colorElegido)
                .font(.title3)
                .accessibilityIdentifier("ColorText")
            
            TextField("Usuario", text: $usuario)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .accessibilityIdentifier("UserTextField")
            
            TextField("Contraseña", text: $contrasena)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .accessibilityIdentifier("PasswordTextField")
            
            Text(mensaje)
                .foregroundStyle(.red)
                .accessibilityIdentifier("MensajeError")
            
            Button("Iniciar sesión") {
                if usuario == usuarioActual && contrasena == contrasenaActual {
                    mensaje = ""
                    entrar = true
                } else {
                    mensaje = "Usuario o contraseña incorrectos"
                }
            }
            .accessibilityIdentifier("LoginButton")
            .sheet(
                isPresented: $entrar) {
                    VistaApp()
                }
            
            
        }
        .padding()
    }
}

struct VistaApp : View {
    var body: some View {
       Text("App")
            .font(.largeTitle)
            .accessibilityIdentifier("AdentroApp")
    }
    
}

#Preview {
    ContentView()
}
