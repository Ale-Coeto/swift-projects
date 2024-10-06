//
//  HomeView.swift
//  Lessons
//
//  Created by Alejandra Coeto on 26/09/24.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationStack {
            VStack {

                Spacer()
                Text("My projects")
                    .font(.title)
                Spacer()
                
                VStack(spacing: 20) {
                    
                    NavigationLink {
                        Divisas()
                    } label: {
                        Text("Divisas")
                        
                    }
                    
                    NavigationLink {
                        BindingView()
                    } label: {
                        Text("Binding example")
                    }
                    
                    NavigationLink {
                        VariasVistas()
                    } label: {
                        Text("Multiple views")
                    }
                    
                    NavigationLink {
                        NavView()
                    } label: {
                        Text("Navigation view")
                    }

                }
                
                Spacer()
                            
            }
            
        }
    }
}

#Preview {
    HomeView()
}
