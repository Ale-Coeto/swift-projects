//
//  DetailView.swift
//  Lessons
//
//  Created by Alejandra Coeto on 03/10/24.
//

import SwiftUI

struct DetailView: View {
    var jugador: Jugador
    
    var body: some View {
        VStack {
            
            Text("Jugador")
                .font(.title)
                .bold()
                .padding(.bottom, 60)
            Image(systemName: "person.crop.circle")
                .font(.system(size: 120))
                .padding(.bottom, 20)
                .foregroundStyle(.tint)
            
            Text(jugador.nombre)
            
            Text(jugador.email)
                .padding(.bottom, 40)
            
            Text("\(jugador.puntos) puntos")
                .padding(.horizontal, 50)
                .padding(.vertical, 20)
                .background(.tint)
                .foregroundStyle(.white)
                .clipShape(.rect(cornerRadius: 10))
                
                
        }
    }
}

#Preview {
    DetailView(jugador: Jugador(id: 1, nombre: "Holanda", puntos: 200, email: "a2@ds.x"))
}
