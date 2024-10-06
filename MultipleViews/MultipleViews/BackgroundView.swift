//
//  BackgroundView.swift
//  MultipleViews
//
//  Created by Alejandra Coeto on 02/10/24.
//

import SwiftUI
struct rectangle: View {
    @Environment(\.dismiss) var dismiss
    @Binding var color: Color
    var newColor: Color
    
    var body: some View {
        Button(action: {
            color = newColor
            dismiss()
        }, label: {
            Rectangle()
                .fill(newColor)
                .onTapGesture {
                    color = newColor
                    dismiss()
                }
        })
        
    }
}

struct BackgroundView: View {
    @Binding var color: Color
    var colors: [Color] = [Color(red: 204/255, green: 103/255, blue: 240/255), Color(red: 99/255, green: 224/255, blue: 170/250), Color(red: 80/255, green: 160/255, blue: 225/255), Color(red: 255/255, green: 216/255, blue: 88/255)]
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    
                    rectangle(color: $color, newColor: colors[0])
                    
                    rectangle(color: $color, newColor: colors[1])
                }
                
                HStack {
                    
                    rectangle(color: $color, newColor: colors[2])
                    
                    rectangle(color: $color, newColor: colors[3])
                    
                }
            }
            .padding()
        }
    }
}

#Preview {
    BackgroundView(color: .constant(.cyan))
}
