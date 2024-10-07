//
//  ComponentsView.swift
//  Lessons
//
//  Created by Alejandra Coeto on 07/10/24.
//

import SwiftUI

struct FormsView: View {
    @State var fecha = Date()
    
    var entreSemana = ["Lun", "Mar", "Mie",
    "Jue", "Vie"]
    
    @State var diaElegido = ""
    @State var number = 0.0
    
    var body: some View {
        Form  {
            Section {
                DatePicker("Fecha de nacimiento", selection: $fecha, displayedComponents: .date)
                
                Text("\(fecha)")
                
            } header: {
                Text("Encabezado sección 1")
            }
            
            
            Section {
                let dateDifference = Calendar.current.dateComponents([.year], from: fecha, to: Date.now)
                
                if let edad = dateDifference.year {
                    Text("Edad \(edad)")
                }
                
                Picker("Elige una fecha", selection: $diaElegido) {
                    ForEach(entreSemana, id:\.self) { dia in
                        Text(dia)
                    }
                }
                .pickerStyle(.segmented)
                
                Slider(value: $number, in: 0...50, step:10, label: {
                    Text("Elige un numero")
                }, minimumValueLabel: {
                    Text(Image(systemName: "speaker"))
                }, maximumValueLabel:  {
                    Text(Image(systemName: "speaker.wave.3"))
                })
                
                Text("\(number)")
                
                
            } header: {
                Text("Encabezado sección 2")
            }
        }
    }
}

#Preview {
    FormsView()
}
