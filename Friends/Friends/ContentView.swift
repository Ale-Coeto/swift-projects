//
//  ContentView.swift
//  Friends
//
//  Created by Alejandra Coeto on 10/10/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        ZStack {
            Color(.systemGray6)
                .ignoresSafeArea()
            VStack (alignment: .leading) {
                Text("Agregar Amigo")
                    .font(.title2)
                    .fontWeight(.semibold)
                
                VStack {
                    HStack {
                        Text("Nombre: ")
                        TextField("Nombre", text: $viewModel.nombre)
                            .textFieldStyle(.roundedBorder)
                    }
                    Button() {
                        viewModel.addAmigo(viewModel.nombre)
                        
                    } label: {
                        Text("Guardar")
                            .padding(.horizontal)
                            .padding(.vertical, 10)
                            .background(.blue)
                            .foregroundStyle(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                        
                    }
                }
                .padding()
                .background(.white)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                
                Text("Amigos")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .padding(.top, 40)
                
                VStack (alignment: .leading)  {
                    ForEach(viewModel.amigos, id: \.self) {
                        amigo in
                        Text(amigo)
                            .padding()
                            .background(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                    
                }
                
                
            }
            .padding()
        }
       
    }
}

#Preview {
    ContentView()
}
