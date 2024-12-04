//
//  Task.swift
//  DragAndDropKanban
//
//  Created by Sergio Gonzalez on 02/12/24.
//

import Foundation

// TODO: Important imports

enum Status: String, Codable, CaseIterable {
    case todo = "To Do"
    case inProgress = "In Progress"
    case finished = "Finished"
}

@Observable
class Task: Codable, Identifiable, Equatable {
    var id: Int
    var name: String
    var status: Status
    
    
    init(id: Int, name: String, status: Status) {
        self.id = id
        self.name = name
        self.status = status
    }
    
    // MARK: - Equatable
    static func == (lhs: Task, rhs: Task) -> Bool {
        return lhs.id == rhs.id
    }
    
    // MARK: - Codable
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case status
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(id, forKey: .id)
        try container.encode(name, forKey: .name)
        try container.encode(status, forKey: .status)
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.id = try container.decode(Int.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.status = try container.decode(Status.self, forKey: .status)
    }
}

// TODO: - Transferable
