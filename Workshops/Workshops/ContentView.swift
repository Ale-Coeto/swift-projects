//
//  ContentView.swift
//  Workshops
//
//  Created by Alejandra Coeto on 03/12/24.
//

import SwiftUI

struct ContentView: View {
    @State private var zoomScale: CGFloat = 1.0
    @State private var isSaved: Bool = false
    @State private var bounce: Bool = false
    
    var body: some View {
        VStack {
            Image("testPin2")
                .resizable()
                .frame(maxWidth: .infinity)
                .cornerRadius(20)
                .padding(.bottom, 10)
                .scaleEffect(zoomScale)
                .gesture(
                    MagnificationGesture()
                        .onChanged {
                            value in
                            zoomScale = value
                        }
                        .onEnded { _ in
                            withAnimation(
                                Animation.spring(response: 0.3, dampingFraction: 0.5)
                            ) {
                                zoomScale = 1.0
                            }
                        }
                )
        }
        .padding()
        
        HStack (spacing: 10) {
            Button() {
                
            } label: {
                Image(systemName: "heart")
                    .font(.system(size: 20))
                    .foregroundColor(.black)
            }
            
            Button() {
                
            } label: {
                Image(systemName: "bubble.left")
                    .font(.system(size: 20))
                    .foregroundColor(.black)
            }
            
            Button() {
                
            } label: {
                Image(systemName: "square.and.arrow.up")
                    .font(.system(size: 20))
                    .foregroundColor(.black)
            }
            
            Button() {
                
            } label: {
                Image(systemName: "ellipsis")
                    .font(.system(size: 20))
                    .foregroundColor(.black)
            }
            
            Spacer()
            
            Button() {
                isSaved.toggle()
                bounce = true
                withAnimation(
                    Animation.spring(response: 0.3, dampingFraction: 0.5)
                ) {
                    bounce = false
                }
            } label: {
                Text(isSaved ? "Saved" : "Save")
                    .padding(.horizontal, 17)
                    .padding(.vertical, 10)
                    .background(isSaved ? Color.black : Color.red)
                    .font(.headline)
                    .foregroundColor(.white)
                    .cornerRadius(50)
                    .scaleEffect(bounce ? 1.1 : 1.0)
            }
        }
        .padding(.top, 10)
        .padding(.horizontal, 20)
    }
}

#Preview {
    ContentView()
}
