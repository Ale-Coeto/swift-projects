//
//  SwiftUIView.swift
//  Calculo
//
//  Created by Alejandra Coeto on 26/09/24.
//

import SwiftUI

struct VistaFoto: View {
    var foto : Image
    var body: some View {
        foto
            .resizable()
            .aspectRatio(contentMode: .fit)
    }
}

#Preview {
    VistaFoto(foto: Image("Donald"))
}
