//
//  TinyWeather.swift
//  TinyWeather
//
//  Created by Elliott Chkayben on 2021-02-21.
//

import WidgetKit
import SwiftUI
import Intents

struct Provider: IntentTimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), configuration: ConfigurationIntent())
    }

    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), configuration: configuration)
        completion(entry)
    }

    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, configuration: configuration)
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let configuration: ConfigurationIntent
}

struct TinyWeatherEntryView : View {
    var entry: Provider.Entry
    
    var viewModel = WeatherViewModel()

    var body: some View {
        GeometryReader { geo in
            ZStack {
                Rectangle()
                    .fill(Color.background)
                VStack(alignment: .leading) {
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 2)
                            .fill(Color.background)
                            .frame(width: geo.size.width - 40, height: 20)
                            .shadow(color: Color.lightShadow, radius: 2, x: -2, y: -2)
                            .shadow(color: Color.darkShadow, radius: 2, x: 2, y: 2)
                        
                        HStack {
                            Image("pin")
                                .resizable()
                                .frame(width: 7, height: 10, alignment: .center)

                            Text("Toronto, Canada")
                                .font(.caption2)
                        }
                        .padding(.trailing, 8)
                    }
                    .padding(.leading, 8)
                    
                    HStack {
                        VStack {
                            Text(viewModel.weatherData.todaysForecast.title)
                                .font(.caption)
                                .fontWeight(.medium)
                            
                            Text(viewModel.weatherData.todaysForecast.temp.degreesToString())
                                .font(.largeTitle)
                                .fontWeight(.bold)
                            
                            Text(viewModel.weatherData.todaysForecast.description)
                                .foregroundColor(Color.secondaryColor)
                                .font(.caption)
                            
                        }
                        Image("cloudy")
                            .resizable()
                            .frame(width: 20, height: 15)
                            .padding(.trailing, 8)
                    }
                    .frame(width: geo.size.width - 16, height: 120)
                }
            }
        }
    }
}

extension View {
    public func gradientForeground(colors: [Color]) -> some View {
        self.overlay(LinearGradient(gradient: .init(colors: colors),
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing))
            .mask(self)
    }
}

@main
struct TinyWeather: Widget {
    let kind: String = "TinyWeather"

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
            TinyWeatherEntryView(entry: entry)
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
    }
}

struct TinyWeather_Previews: PreviewProvider {
    static var previews: some View {
        TinyWeatherEntryView(entry: SimpleEntry(date: Date(), configuration: ConfigurationIntent()))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
