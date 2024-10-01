//
//  ContentView.swift
//  Calculo
//
//  Created by Alejandra Coeto on 23/09/24.
//

import SwiftUI

struct Divisas: View {
    
    @State var tipoCambio = ""
    @State var pesos = ""
    @State var dolares = ""
    @State var mostrarAlerta = false
    @FocusState var tipoCambioFocused: Bool
    
    var body: some View {
        ZStack {
            
            Color.white
            
            Rectangle()
                .frame(width: 200)
                .foregroundColor(.blue)
                .rotationEffect(Angle(degrees: -80))
                .offset(y: -250)
            
            
            VStack {
     
                        Text("Divisas")
                            .font(.largeTitle)
                            .fontWeight(.semibold)
                            .foregroundStyle(Color("TitleColor"))
                            .padding(.bottom, 30)
                        
                        HStack {
                            Text("Tipo de cambio: ")
                            TextField("", text: $tipoCambio)
                                .textFieldStyle(.roundedBorder)
                                .keyboardType(.decimalPad)
                                .focused($tipoCambioFocused)
                        }
                        
                        HStack {
                            Text("Pesos: ")
                            TextField("", text: $pesos)
                                .textFieldStyle(.roundedBorder)
                                .keyboardType(.decimalPad)
                                .focused($tipoCambioFocused)
                        }
                        
                        HStack {
                            Text("Dolares: ")
                            TextField("", text: $dolares)
                                .textFieldStyle(.roundedBorder)
                                .keyboardType(.decimalPad)
                                .focused($tipoCambioFocused)
                                .disabled(true)
                        }
                        
                        Button {
                            if let tipoCambio = Double(tipoCambio), let pesos = Double(pesos) {
                                dolares = String(pesos/tipoCambio)
                            } else {
                                mostrarAlerta = true
                            }
                            
                            print(pesos)
                        } label: {
                            Image("boton-calcular")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .padding(.horizontal, 100)
                                .padding(.top)
                            
                        }
                        
                        Image("dollarSign")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 200)
                            .padding(.top, 50)
                        
                    }
            .padding(30)
            .background(Color("LightGray"))
            .cornerRadius(15)
            .shadow(radius: 5)
                    
                }
                .alert("Error", isPresented: $mostrarAlerta, actions: {
                    
                }, message: {
                    Text("Teclea datos numéricos")
                })
                .padding(.horizontal, 30)
                .onTapGesture {
                    tipoCambioFocused = false
                }
            }
        
}

#Preview {
    Divisas()
}
