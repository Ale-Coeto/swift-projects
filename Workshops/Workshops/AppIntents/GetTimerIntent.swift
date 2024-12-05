//
//  GetTimerIntent.swift
//  Workshops
//
//  Created by Alejandra Coeto on 04/12/24.
//

import Foundation
import AppIntents

struct GetTimerIntent: AppIntent {
    static var title: LocalizedStringResource = "Obtener temporizador"
    
    func perform() async throws -> some IntentResult & ReturnsValue<Int> {
        let remainingSeconds = TimerViewModel.shared.getTimer()
        
        return .result(value: remainingSeconds)
    }
}
