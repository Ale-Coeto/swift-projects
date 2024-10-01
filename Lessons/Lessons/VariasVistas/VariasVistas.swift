//
//  VariasVistas.swift
//  Calculo
//
//  Created by Alejandra Coeto on 26/09/24.
//

import SwiftUI

struct VariasVistas: View {
    @State var nombre = "Donald"
    @State var email = "@.tec.mx"
    @State var mostrarFoto = false
    @State var foto: Image = Image("Donald")
    @State var mostrarEditar = false
    
    var body: some View {
        VStack(spacing: 0) {
            ZStack {
                Color.init(red: 129/255, green: 236/255, blue: 236/255)
                    .ignoresSafeArea()
                
                VStack {
                    Text(nombre)
                    Button {
                        mostrarFoto = true
                    } label: {
                        foto
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    }
                    .sheet(isPresented: $mostrarFoto) {
                        VistaFoto(foto: foto)
                    }
                    
                    
                }
                
            }
            ZStack {
                Color.init(red: 116/255, green: 185/255, blue: 255/255)
                    .ignoresSafeArea()
                VStack {
                    Image(systemName: "globe")
                        .imageScale(.large)
                        .foregroundStyle(.tint)
                    Text("Nombre: " + nombre)
                    Text("Email: " + email)
                    
                    Button("Editar") {
                        mostrarEditar = true
                    }
                    .padding()
                    .background(.white)
                    .cornerRadius(5)
                    .sheet(isPresented: $mostrarEditar) {
                        VistaEditar(nombre: $nombre, email: $email)
                    }
                    
                }
            }
        }
    }
}

#Preview {
    VariasVistas()
}
