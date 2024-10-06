//
//  ContentView.swift
//  MultipleViews
//
//  Created by Alejandra Coeto on 02/10/24.
//

import SwiftUI

struct NavButton: View {
    @Binding var selectedView: Int
    @Binding var openView: Bool
    var title: String
    var id: Int
    
    var body: some View {
        Button(title) {
            selectedView = id
            openView = true
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 8)
        .background(.blue)
        .cornerRadius(12)
        .foregroundColor(.white)
    }
}

struct ContentView: View {
    @State var bgColor: Color = .cyan
    @State var openViewImg = false
    @State var openViewColor = false
    @State var openViewMsg = false
    @State var selectedView: Int
    @State var message = "Estás invitado"
    @State var title = "Invitación"
    @State var image: Image = Image("Party")
    
    var body: some View {
        ZStack {
            Color(bgColor)
                .opacity(0.5)
            
            VStack {
                
                Spacer()
                Text("Visualiza tu invitación")
                    .font(.title)
                    .fontWeight(.semibold)
                
                Text("Modifica el color, la imagen y el fondo")
                    
                Spacer()
                
                VStack {
                    Text(title)
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                    
                    Text(message)
                        .padding(.bottom, 40)
                        .foregroundStyle(.white)
                    
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        
        
                }
                .padding(40)
                .border(.white, width: 4)
                .background(bgColor)
                .padding(.horizontal)
                .shadow(radius: 5)
                
                Spacer()
                
                HStack {
                    Spacer()
                    NavButton(selectedView: $selectedView, openView: $openViewColor, title: "Fondo", id: 2)
                    Spacer()
                    NavButton(selectedView: $selectedView, openView: $openViewImg, title: "Imagen", id: 1)
                    Spacer()
                    NavButton(selectedView: $selectedView, openView: $openViewMsg, title: "Mensaje", id: 3)
                    Spacer()
                }
                .padding()
                
                Spacer()
            }
            
            
        }
        .ignoresSafeArea()

        .sheet(isPresented: $openViewImg, content: {
            ImageSelectionView(image: $image)
        })
        .sheet(isPresented: $openViewColor, content: {
            BackgroundView(color: $bgColor)
        })
        .sheet(isPresented: $openViewMsg, content: {
            MessageView(message: $message, title: $title)
        })
    }
    

}



#Preview {
    ContentView(selectedView: 1)
}
