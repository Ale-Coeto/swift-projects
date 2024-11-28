//
//  LowerView.swift
//  EvaluacionFinal
//
//  Created by Alejandra Coeto on 28/11/24.
//

import SwiftUI

struct LowerView: View {
    @StateObject var viewModel = LowerViewModel()
    
    var body: some View {
        ZStack {
            Color(.mint)
            
            VStack {
                Text("\(viewModel.value)")
                
                Button {
                    viewModel.openSheet()
                } label: {
                    Text("Cargar vista")
                }
            }
            .sheet(isPresented: $viewModel.isSheetOpen) {
                SliderView(viewModel: viewModel)
            }
        }
    }
}

#Preview {
    LowerView(viewModel: LowerViewModel())
}
