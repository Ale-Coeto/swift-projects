//
//  AddZone.swift
//  EvaluacionFinal
//
//  Created by Alejandra Coeto on 28/11/24.
//

import SwiftUI

struct AddZone: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var viewModel: UpperViewModel
    @State var nombre: String = ""
    @State var descripcion: String = ""
    
    var body: some View {
        VStack (spacing: 0) {
            
            Form {
                HStack {
                    Text("Nombre: ")
                    TextField("Placeholder", text: $nombre)
                }
                
                HStack {
                    Text("Descripción: ")
                    TextField("Placeholder", text: $descripcion)
                }
            }
            
            ZStack {
                Color(.systemGray6)
                VStack {
                    
                    Text("Color de la zona")
                    Rectangle()
                        .fill(.red)
                        .frame(width: 200, height: 200)
                    
                    Button {
                        viewModel.addZona(nombre: nombre, descripcion: descripcion)
                        dismiss()
                    } label: {
                        Text("Guardar")
                    }
                }
            }
            .ignoresSafeArea()
//            .background()
        }
    }
}

#Preview {
    AddZone(viewModel: UpperViewModel())
}
