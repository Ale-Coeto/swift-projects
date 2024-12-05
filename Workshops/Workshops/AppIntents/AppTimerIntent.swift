//
//  AppTimerIntent.swift
//  Workshops
//
//  Created by Alejandra Coeto on 04/12/24.
//

import SwiftUI

import AppIntents

struct AddTimerIntent: AppIntent {
    static var title = LocalizedStringResource("Agregar temporizador")
    
    enum TimeUnit: String, AppEnum {
        case seconds = "Seconds"
        case minutes = "Minutes"
        
        static var typeDisplayRepresentation: TypeDisplayRepresentation {
            "Time Unit"
        }
        
        static var caseDisplayRepresentations: [Self: DisplayRepresentation] {
            [
                .seconds: DisplayRepresentation(title: "Seconds"),
                .minutes: DisplayRepresentation(title: "Minutes")
            ]
        }
    }
    
    @Parameter(
        title: "Duration",
        description: "Specify the time)"
    )
    var duration: Int
    
    func perform() async throws -> some IntentResult {
        if duration > TimerViewModel.shared.getTimer() {
            TimerViewModel.shared.addTimer(seconds: duration)
        }
        
        return .result()
    }
}
