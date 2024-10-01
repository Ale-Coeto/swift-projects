//
//  ContentView.swift
//  MapView
//
//  Created by Alejandra Coeto on 30/09/24.
//

import SwiftUI
import MapKit



struct ContentView: View {
    var regionCerroDeLaSilla: MKCoordinateRegion {
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 25.635, longitude: -100.2329),
            span:MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
            )
    }
    
    var body: some View {
        ZStack {
            Color("BG")
            VStack {
                VStack (spacing: 0) {
                    Map(initialPosition: .region(regionCerroDeLaSilla))
                        .frame(height: 400)
                        .border(Color.white, width: 3)
                        .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                    
                    Image("MTY")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 200)
                        .clipShape(Circle())
                        .overlay {
                            Circle().stroke(Color.white, lineWidth: 3)
                        }
                        .shadow(radius: 5)
                        .offset(y:-100)
                        
                }
                Text("Cerro de la silla")
                    .font(.title)
                    .bold()
                    .foregroundStyle(.white)
                    
                Divider()
                    .background(.white)
                    
                HStack {
                    Text("Monterrey")
                        .foregroundStyle(.white)
                    Spacer()
                    Text("México")
                        .foregroundStyle(.white)
                }
                .padding()
            }
            .padding()
        }
        .ignoresSafeArea()
        
       
    }
}

#Preview {
    ContentView()
}
