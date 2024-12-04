//
//  KanbanView.swift
//  DragAndDropKanban
//
//  Created by Sergio Gonzalez on 02/12/24.
//

import SwiftUI

struct KanbanViewTask: View {
    @State var tasks: [Task] = [
        Task(id: 1, name: "Do Homework", status: .todo),
        Task(id: 2, name: "Watch Arcane", status: .inProgress),
        Task(id: 3, name: "Attend iOS Drag and Drop course", status: .finished),
    ]
    
    var body: some View {
        ScrollView {
            ForEach(Status.allCases, id: \.self ) { status in
                RowViewTask(tasks: $tasks, status: status)
                    .padding(.top)
            }
        }
        .padding(.vertical)
    }
}

struct RowViewTask: View {
    @Binding var tasks: [Task]
    var status: Status
    
    var filteredTasks: [Task] {
        tasks.filter( { $0.status == status } )
    }
    
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
            Text(status.rawValue)
                .bold()
            ZStack {
                RoundedRectangle(cornerRadius: 15)
                    .frame(maxWidth: .infinity)
                    .frame(height: 200)
                    .foregroundStyle(backgroundColor)
                    .padding(.horizontal)
                
                VStack {
                    ForEach (filteredTasks, id: \.id) { task in
                        Text(task.name)
                            .padding()
                            .background(Color(uiColor: .secondarySystemGroupedBackground))
                            .clipShape(RoundedRectangle(cornerRadius: 15))
                        // TODO: draggable
                    }
                }
                // TODO: animation
            }
        }
        // TODO: dropDestination
    }
}

#Preview {
    KanbanView()
}
