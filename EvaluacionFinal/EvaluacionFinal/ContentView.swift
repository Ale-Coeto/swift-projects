//
//  ContentView.swift
//  EvaluacionFinal
//
//  Created by Alejandra Coeto on 28/11/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            UpperView()
                .padding(.horizontal, 10)
                .padding(.top, 10)
            LowerView()
                .padding(.horizontal, 10)
                .padding(.bottom, 10)
        }
    }
}

#Preview {
    ContentView()
}
