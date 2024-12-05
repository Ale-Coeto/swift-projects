//
//  AppIntent.swift
//  Time
//
//  Created by Alejandra Coeto on 04/12/24.
//

import WidgetKit
import AppIntents

struct ConfigurationAppIntent: WidgetConfigurationIntent {
    init() {
        
    }
    
    static var title: LocalizedStringResource { "Configuration" }
    static var description: IntentDescription { "This is an example widget." }

    // An example configurable parameter.
    @Parameter(title: "Favorite Phrase", default: "Work hard")
    var phrase: String
    
    init(phrase: String) {
        self.phrase = phrase
    }
}
