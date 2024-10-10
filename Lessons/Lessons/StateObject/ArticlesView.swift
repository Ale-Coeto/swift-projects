//
//  ArticlesView.swift
//  Lessons
//
//  Created by Alejandra Coeto on 08/10/24.
//

import SwiftUI

struct ArticlesView: View {
    @StateObject var listaArticulos = ListaArticulos()
    @State var muestraAgregar = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(listaArticulos.articulos) {
                    articulo in
                    NavigationLink {
                        ArticleDetailView(nombre: articulo.nombre, cantidad: articulo.cantExist, precio: articulo.precio)
                    } label: {
                        Text(articulo.nombre)
                    }
                }
                .onDelete(perform: borrarArticulos)
            }
            .navigationTitle("Articulos")
            .toolbar {
                Button {
                    muestraAgregar = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $muestraAgregar, content: {
                NewArticleView(listaArticulos: listaArticulos)
            })
        }
        
    }
    
    func borrarArticulos(at offsets: IndexSet) {
        listaArticulos.articulos.remove(atOffsets: offsets)
    }
}

#Preview {
    ArticlesView()
}
