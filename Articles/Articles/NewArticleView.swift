//
//  ArticleDetailedView.swift
//  Lessons
//
//  Created by Alejandra Coeto on 08/10/24.
//

import SwiftUI

struct NewArticleView: View {
    @Environment(\.dismiss) var quitarVista
    @ObservedObject var listaArticulos: ListaArticulos
    @State var nombre = ""
    @State var precio: Float = 0.0
    @State var cantExist = 0
    @State var showAlert = false
        
    var body: some View {
        
        NavigationStack {
            VStack {
                Text("Registro de artículos")
                    .font(.title)
                    .padding()
                
                Form {
                    HStack {
                        Text("Nombre ")
                            .autocorrectionDisabled()
                        TextField("Nombre", text: $nombre)
                    }
                    
                    HStack {
                        Text("Precio ")
                            
                        TextField("Precio", value: $precio, format: .number)
                    }
                    
                    HStack {
                        Text("Cantidad ")
                        TextField("Cantidad en existencia", value: $cantExist, format: .number)
                    }
                }
                
                .toolbar {
                    Button {
                        if nombre != "" && precio != 0.0 && cantExist != 0 {
                            let articulo = Articulo(nombre: nombre, precio: precio, cantExist: cantExist)
                            listaArticulos.articulos.append(articulo)
                            quitarVista()
                        } else {
                            showAlert = true
                        }
                        
                           
                    } label: {
                        Text("Guardar")
                    }
                }
                .alert("Error", isPresented: $showAlert, actions: {
                                    
                    }, message: {
                        Text("Ingresa todos los datos")
                    })
            }
            .background(Color(.systemGray6))
        }
        
        
        
        
    }
    
}

#Preview {
    NewArticleView(listaArticulos: ListaArticulos())
}
