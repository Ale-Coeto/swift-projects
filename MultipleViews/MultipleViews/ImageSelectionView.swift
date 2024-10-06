//
//  ImageSelectionView.swift
//  MultipleViews
//
//  Created by Alejandra Coeto on 02/10/24.
//

import SwiftUI

struct img: View {
    @Environment(\.dismiss) var dismiss
    @Binding var image: Image
    var newImage: Image
    
    var body: some View {
        Button(action: {
            image = newImage
            dismiss()
        }, label: {
            newImage
                .resizable()
                .aspectRatio(contentMode: .fit)
        })
        
    }
}

struct ImageSelectionView: View {
    @Binding var image: Image
    
    var body: some View {
        
            VStack {
                
                img(image: $image, newImage: Image("Heroes"))
                
                img(image: $image, newImage: Image("Party"))
                
                img(image: $image, newImage: Image("Animals"))

                img(image: $image, newImage: Image("Princess"))
                
                              

            }
            .padding()
        
    }
}

#Preview {
    ImageSelectionView(image: .constant(Image("Snow")))
}
