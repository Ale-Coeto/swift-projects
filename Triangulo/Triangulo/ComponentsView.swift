//
//  ComponentsView.swift
//  Triangulo
//
//  Created by Alejandra Coeto on 26/09/24.
//

import SwiftUI

//Triangle View
struct TriangleView : Shape {
    var p1: CGPoint
    var p2: CGPoint
    var p3: CGPoint
    
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: p1) // Bottom left
            path.addLine(to: p2) // Bottom right
            path.addLine(to: p3) // Top vertex
            path.closeSubpath()
        }
    }
    
}

//InputsView
struct InputsView: View {
    @ObservedObject var viewModel: ViewModel
    @FocusState var focused: Bool
    
    var body: some View {
   
            
            VStack {
                Text("Lados")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .fontWeight(.semibold)
                
                Text("Ingresa las medidas de cada lado")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundStyle(Color("Subtitles"))
                    .padding(.bottom)
                
                TextField("", text: $viewModel.sideX)
                    .textFieldStyle(.roundedBorder)
                    .keyboardType(.decimalPad)
                    .focused($focused)
                
                TextField("", text: $viewModel.sideY)
                    .textFieldStyle(.roundedBorder)
                    .keyboardType(.decimalPad)
                    .focused($focused)
                
                TextField("", text: $viewModel.sideZ)
                    .textFieldStyle(.roundedBorder)
                    .keyboardType(.decimalPad)
                    .focused($focused)
                
                
                Button(action: {
                    viewModel.setSides()
                }, label: {
                    Text("Calcular")
                        .padding(.horizontal, 15)
                        .padding(.vertical, 10)
                        .background(.green)
                        .cornerRadius(15)
                        .foregroundStyle(.white)
                    
                })
                .padding(.top)
                
            }
            .padding(30)
            .background(.white)
            .cornerRadius(15)
            .onTapGesture {
                focused = false
            }
        }
    
    
}

//Results view
struct ResultsView: View {
    @ObservedObject var viewModel : ViewModel
    var body: some View {
        VStack {
            Text("Resultado")
                .frame(maxWidth: .infinity, alignment: .leading)
                .fontWeight(.semibold)
                
            
            HStack {
                Text("Area: ")
                    
                Text("\(viewModel.area)")
                    .foregroundStyle(Color("Subtitles"))
                
                Spacer()
            }
            
            HStack {
                Text("Tipo: ")
                
                Text("\(viewModel.tipo)")
                    .foregroundStyle(Color("Subtitles"))
                
                Spacer()
            }
            .padding(.bottom)
            
            ZStack {
                TriangleView(p1: viewModel.p1, p2: viewModel.p2, p3: viewModel.p3)
                    .fill(Color.blue)
                    .frame(width: 200, height: 200)
                    .border(Color.black)
            }
            
        }
        .padding(30)
        .background(.white)
        .cornerRadius(15)
    }
}

#Preview {
    VStack {
        InputsView(viewModel: ViewModel())
        ResultsView(viewModel: ViewModel())
    }
    .background(.black)
}


