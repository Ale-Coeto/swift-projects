//
//  SliderView.swift
//  EvaluacionFinal
//
//  Created by Alejandra Coeto on 28/11/24.
//

import SwiftUI

struct SliderView: View {
    @ObservedObject var viewModel: LowerViewModel
    
    var body: some View {
        Slider(value: $viewModel.value, in: 0...10, step: 1, label: {
                  Text("Duración")
              }, minimumValueLabel: {
                  Text(Image(systemName: "minus"))
              }, maximumValueLabel: {
                  Text(Image(systemName: "plus"))
              })
        .padding()
    }
}

#Preview {
    SliderView(viewModel: LowerViewModel())
}
