//
//  VistaEditar.swift
//  Calculo
//
//  Created by Alejandra Coeto on 26/09/24.
//

import SwiftUI

struct VistaEditar: View {
    @Environment(\.dismiss) var dismiss
    @Binding var nombre : String
    @Binding var email : String
    
    @State var nombreTmp : String = ""
    @State var emailTmp : String = ""
    
    var body: some View {
        VStack {
            Text("Datos del usuario")
                .font(.largeTitle)
                .bold()
            
            HStack {
                Text("Nombre")
                TextField("", text: $nombreTmp)
                    .textFieldStyle(.roundedBorder)
            }
            
            HStack {
                Text("Email")
                TextField("", text: $emailTmp)
                    .textFieldStyle(.roundedBorder)
            }
            
            HStack {
                Button("Cancelar") {
                    dismiss()
                }
                .font(.title3)
                
                Spacer()
                
                Button("Guardar") {
                    
                }
                .font(.title3)
            }
            .padding(50)
        }
        .padding()
        .onAppear() {
            nombreTmp = nombre
            emailTmp = email
        }
    }
}

#Preview {
    VistaEditar(nombre: .constant("Mickey"), email: .constant("Mick@lkae.com"))
}
