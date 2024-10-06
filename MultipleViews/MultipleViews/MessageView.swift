//
//  MessageView.swift
//  MultipleViews
//
//  Created by Alejandra Coeto on 02/10/24.
//

import SwiftUI

struct MessageView: View {
    @Environment(\.dismiss) var dismiss
    @Binding var message: String
    @Binding var title: String

    var body: some View {
        ZStack {
            VStack {
                Text("Personaliza tu mensaje")
                    .font(.title)
                    .padding(.bottom, 40)
                    
                VStack (alignment: .leading) {
                    Text("Título")
                    TextField("Hi", text: $title)
                        .textFieldStyle(.roundedBorder)
                    
                    Text("Mensaje")
                    TextField("Hi", text: $message)
                        .textFieldStyle(.roundedBorder)
                }
                .padding(.bottom, 40)
                Button("Modificar") {

                    dismiss()
                }
            }
            .padding()
        }

    }
}

#Preview {
    MessageView(message: .constant("hello"), title: .constant("Hi"))
}
