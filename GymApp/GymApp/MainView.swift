//
//  ContentView.swift
//  GymApp
//
//  Created by Alejandra Coeto on 07/10/24.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewVM()
    
    var body: some View {
        VStack {
            Text("Gimnasio")
                .font(.title)
                .fontWeight(.semibold)
                .padding(.top)
            
            
            Form {
                Section {
                    HStack {
                        Text("Nombre: ")
                        TextField("Nombre", text: $viewModel.nombre)
                    }
                    
                    HStack {
                        
                        DatePicker("Fecha de nacimiento", selection: $viewModel.fechaNacimiento, displayedComponents: .date)
                    }
                } header: {
                    Text("Datos generales")
                }
                
                Section {
                    Picker("Elige un aparato", selection: $viewModel.aparato) {
                        ForEach(viewModel.aparatos, id: \.self) {
                            aparato in
                            Text(aparato)
                        }
                    }
                    
                    VStack(alignment: .leading) {
                        HStack {
                            Text("Duración")
                            Spacer()
                            Text("\(Int(viewModel.duracion)) minutos")
                        }
                        
                        Slider(value: $viewModel.duracion, in: 5...45, step: 5, label: {
                            Text("Duración")
                        }, minimumValueLabel: {
                            Text(Image(systemName: "5.circle"))
                        }, maximumValueLabel: {
                            Text(Image(systemName: "45.circle"))
                        })
                    }
                    
                    VStack(alignment: .leading) {
                        Text("Intensidad")
                        Picker("Intensidad", selection: $viewModel.intensidad) {
                            ForEach(viewModel.intensidades, id: \.self) {
                                intensidad in
                                Text(intensidad)
                            }
                        }
                        .pickerStyle(.segmented)
                    }
                    
                } header: {
                    Text("Ejercicio")
                }
                
                Section {
                    ZStack {
                        Color(viewModel.colores[viewModel.intensidad] ?? Color(.gray))
                            .opacity(0.5)
                        VStack {
                            HStack {
                                Text("Aparato")
                                Spacer()
                                Text(viewModel.aparato)
                            }
                            
                            HStack {
                                Text("Tipo de ejercicio")
                                Spacer()
                                Text(viewModel.intensidad)
                            }
                            
                            HStack {
                                Text("Duración")
                                Spacer()
                                Text("\(Int(viewModel.duracion)) minutos")
                            }
                            
                            HStack {
                                Text("Edad")
                                Spacer()
                                Text("\(Int(viewModel.edad)) años")
                            }
                            
                            Text("Fecuencia cardiaca recomendada")
                            
                            HStack {
                                Text("Intensidad mínima")
                                Text("\(viewModel.intensidadMin)")
                            }
                            
                            HStack {
                                Text("Intensidad máxima")
                                Text("\(viewModel.intensidadMax)")
                            }
                        }
                        .padding()
                    }
                    .padding(.vertical)
                    
                    
                } header: {
                    Text("Resumen del ejercicio")
                }
            }
        }
        .background(Color(.systemGray6))
    }
        
}

#Preview {
    MainView()
}
