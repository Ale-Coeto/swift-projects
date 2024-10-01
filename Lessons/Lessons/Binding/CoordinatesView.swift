//
//  CoordinatesView.swift
//  Binding
//
//  Created by Alejandra Coeto on 24/09/24.
//

import SwiftUI

struct Coord {
    var x : Int
    var y : Int
}

struct CoordinatesView: View {
    
    @State var c1 : Coord = Coord(x: 0, y: 0)
    @State var c2 : Coord = Coord(x: 0, y: 0)
    
    var body: some View {
        ZStack {
            Color.teal
                .ignoresSafeArea()
            VStack {
                
                Spacer()
                
                Text("Coordenada A (\(c1.x), \(c1.y))")
                LectorCoordenadas(coor: $c1, texto: "A")
                
                Spacer()
                
                Text("Coordenada B (\(c2.x), \(c2.y))")
                LectorCoordenadas(coor: $c2, texto: "B")
                
                Spacer()
            }
            .padding()
        }
        
    }
}

struct LectorCoordenadas : View {
    
    @Binding var coor : Coord
    @State var texto : String
    @State var x : Int = 0
    @State var y : Int = 0
    
    var body: some View {
        VStack {
            Text(texto)
                .font(.title3)
                .bold()
            
            HStack {
                TextField("x: ", value: $x, format: .number)
                    .textFieldStyle(.roundedBorder)
                    .onChange(of: x) {
                        coor.x = x
                    }
                
                TextField("y: ", value: $coor.y, format: .number)
                    .textFieldStyle(.roundedBorder)
                
                
            }
        }
        .padding()
        .background(.gray)
    }
        
}

#Preview {
    CoordinatesView()
}

