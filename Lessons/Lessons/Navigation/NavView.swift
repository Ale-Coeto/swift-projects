//
//  NavView.swift
//  Lessons
//
//  Created by Alejandra Coeto on 03/10/24.
//

import SwiftUI

struct NavView: View {
    var datosEjemplo = Jugador.datosEjemplo
    
    var body: some View {
        NavigationStack {
            List(datosEjemplo) {
                jugador in
                NavigationLink {
                    DetailView(jugador: jugador)
                } label: {
                    CeldaJugador(jugador: jugador)
                }
            }
            .navigationTitle("Jugadores")
        }
        
    }
}

struct CeldaJugador: View {
    var jugador: Jugador
    
    var body: some View {
        HStack {
            Image(systemName: "person.crop.circle")
                .resizable()
                .frame(width: 50, height: 50)
                .foregroundStyle(.tint)
            VStack (alignment: .leading) {
                Text(jugador.nombre)
                    .font(.title)
                Text(jugador.email)
                    .font(.title2)
                    .foregroundStyle(.gray)
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    NavView()
}
