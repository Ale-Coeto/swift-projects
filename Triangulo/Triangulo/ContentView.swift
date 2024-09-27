//
//  ContentView.swift
//  Triangulo
//
//  Created by Alejandra Coeto on 23/09/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ViewModel()
    @FocusState var focused: Bool
    
    var body: some View {
        ZStack {
            
            Rectangle()
                .fill(
                    Color("BG1")
                )
                .ignoresSafeArea()
            
            VStack {

                Spacer()

                Text("Triángulos")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundStyle(.white)

                Spacer()
            
                InputsView(viewModel: viewModel, focused: _focused)
        
                Spacer()
                
                ResultsView(viewModel: viewModel)
                
                Spacer()
                
            }
            .padding(.horizontal, 30)
        }
        .alert("Error", isPresented: $viewModel.showAlert, actions: {
        }, message: {
            Text("Triángulo no válido")
        })
        .onTapGesture {
            focused = false
        }
        
        
    }
}

#Preview {
    ContentView()
}
