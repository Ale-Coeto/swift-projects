//
//  Time.swift
//  Time
//
//  Created by Alejandra Coeto on 04/12/24.
//

import WidgetKit
import SwiftUI

struct Provider: AppIntentTimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), configuration: ConfigurationAppIntent())
    }

    func snapshot(for configuration: ConfigurationAppIntent, in context: Context) async -> SimpleEntry {
        SimpleEntry(date: Date(), configuration: configuration)
    }
    
    func timeline(for configuration: ConfigurationAppIntent, in context: Context) async -> Timeline<SimpleEntry> {
        let entries: [SimpleEntry] = [SimpleEntry(date: .now, configuration: configuration)]

        return Timeline(entries: entries, policy: .never)
    }

}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let configuration: ConfigurationAppIntent
}

struct TimeEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        VStack {
            Text(entry.configuration.phrase)
                .font(.title)
                .fontWeight(.semibold)
                .minimumScaleFactor(0.5)
        }
        .containerBackground(.blue.gradient, for: .widget)
    }
}

struct Time: Widget {
    let kind: String = "Time"

    var body: some WidgetConfiguration {
        AppIntentConfiguration(kind: kind, intent: ConfigurationAppIntent.self, provider: Provider()) { entry in
            TimeEntryView(entry: entry)
                .containerBackground(.fill.tertiary, for: .widget)
        }
    }
}

extension ConfigurationAppIntent {
    fileprivate static var smiley: ConfigurationAppIntent {
        let intent = ConfigurationAppIntent()
        intent.phrase = "HiI"
        return intent
    }
    
    fileprivate static var starEyes: ConfigurationAppIntent {
        let intent = ConfigurationAppIntent()
        intent.phrase = "Nu"
        return intent
    }
}

#Preview(as: .systemSmall) {
    Time()
} timeline: {
    SimpleEntry(date: .now, configuration: ConfigurationAppIntent(phrase: "Hello"))
    SimpleEntry(date: .now, configuration: ConfigurationAppIntent(phrase: "Hola"))
}
