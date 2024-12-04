//
//  KanbanView.swift
//  DragAndDropKanban
//
//  Created by Sergio Gonzalez on 02/12/24.
//

import SwiftUI

struct KanbanView: View {
    @State var activities = [
        ["Do homework", "Sleep"],
        ["Watch Arcane", "Finish Week 18"],
        ["Attend iOS Drag and Drop course"],
    ]
    
    var body: some View {
        ScrollView {
            RowView(rowName: "To Do", activities: $activities, listIndex: 0)
                .padding(.top)
            
            RowView(rowName: "Activities in progress", activities: $activities, listIndex: 1)
                .padding(.top)
            
            RowView(rowName: "Completed Activities", activities: $activities, listIndex: 2)
                .padding(.top)
        }
        .padding(.vertical)
    }
}

struct RowView: View {
    var rowName: String
    @Binding var activities: [[String]]
    var listIndex: Int
    
    @State var isTargeted: Bool = false
    var backgroundColor: Color {
        if isTargeted {
            Color(.quaternarySystemFill)
        } else {
            Color(.secondarySystemFill)
        }
    }
    
    var body: some View {
        VStack {
            Text(rowName)
                .bold()
            ZStack {
                RoundedRectangle(cornerRadius: 15)
                    .frame(maxWidth: .infinity)
                    .frame(height: 200)
                    .foregroundStyle(backgroundColor)
                    .padding(.horizontal)
                
                VStack {
                    ForEach (activities[listIndex], id: \.self) { act in
                        Text(act)
                            .padding()
                            .background(Color(uiColor: .secondarySystemGroupedBackground))
                            .clipShape(RoundedRectangle(cornerRadius: 15))
                            .draggable(act)
                        // TODO: draggable
                    }
                }
                // TODO: animation
                .animation(.spring, value: activities[listIndex])
            }
        }
        // TODO: dropDestination
        .dropDestination(for: String.self) {
            act, location in
            for i in 0..<activities.count {
                activities[i].removeAll(where: {act.contains($0)})
            }
            
            activities[listIndex].append(contentsOf: act)
            return true
        } isTargeted: { isTargeted in
            self.isTargeted = isTargeted
        }
    }
}

#Preview {
    KanbanView()
}
