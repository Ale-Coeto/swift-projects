//
//  ZonasView.swift
//  EvaluacionFinal
//
//  Created by Alejandra Coeto on 28/11/24.
//

import SwiftUI

struct UpperView: View {
    @StateObject var viewModel = UpperViewModel()
    
    
    var body: some View {
        NavigationStack {
            
            List(viewModel.zonas) {
                zona in
                NavigationLink {
                    DetailZoneView(zona: zona)
                } label: {
                    Text(zona.nombre)
                }
                
            }
            .navigationTitle("Zonas")
            .toolbar {
                Button {
                    viewModel.openSheet()
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $viewModel.isSheetOpen, content: {
                AddZone(viewModel: viewModel)
             })
        }
        
    }
}

#Preview {
    UpperView()
}
