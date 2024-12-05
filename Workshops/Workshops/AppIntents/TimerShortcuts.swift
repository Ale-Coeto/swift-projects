//
//  TimerShortcuts.swift
//  Workshops
//
//  Created by Alejandra Coeto on 04/12/24.
//

import Foundation
import AppIntents

struct TimerShortcuts: AppShortcutsProvider {
    static var appShortcuts: [AppShortcut] {
        return [
            AppShortcut(intent: AddTimerIntent(), phrases: ["Start a block session in \(.applicationName)"], shortTitle: "Start timer", systemImageName: "timer")
        ]
    }
}
