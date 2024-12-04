//
//  DragDrop.swift
//  Workshops
//
//  Created by Alejandra Coeto on 03/12/24.
//

import SwiftUI

struct DragDrop: View {
    var body: some View {
        TabView {
            
            KanbanView()
                .tabItem {
                    Label("Strings", systemImage: "abc")
                }
            
            KanbanViewTask()
                .tabItem {
                    Label("Tasks", systemImage: "checkmark.seal.fill")
                }
        }
    }
}

#Preview {
    DragDrop()
}
