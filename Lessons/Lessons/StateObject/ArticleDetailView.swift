//
//  ArticlesDetailedView.swift
//  Lessons
//
//  Created by Alejandra Coeto on 08/10/24.
//

import SwiftUI

struct ArticleDetailView: View {
    var nombre: String
    var cantidad: Int
    var precio: Float
    
    var body: some View {
        VStack {
            Text(Image(systemName: "shippingbox"))
                .font(.largeTitle)
                .padding(.bottom, 40)
                
            Text("Nombre: \(nombre)")
            Text("Cantidad: \(cantidad)")
            Text("Precio: \(precio)")
            
        }
    }
}

#Preview {
    ArticleDetailView(nombre: "Mesa", cantidad: 1, precio: 200)
}
