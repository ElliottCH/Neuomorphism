//
//  WeatherModel.swift
//  NeumorPhism
//
//  Created by Elliott Chkayben on 2021-02-20.
//

import Foundation

struct WeatherForecast {
    var todaysForecast: TodaysForecast
    var daysForecastData: [DaysForecastData]
    
    init(todaysForecast: TodaysForecast,
         daysForecastData: [DaysForecastData]) {
        self.todaysForecast = todaysForecast
        self.daysForecastData = daysForecastData
    }
}

struct TodaysForecast {
    var title: String
    var weatherImage: String
    var temp: Int
    var description: String
    var hourlyForecast: [HourlyForecast]
}

struct HourlyForecast: Hashable {
    var id = UUID()
    var time: String
    var temp: Int
    var weatherImage: String
    
    init(time: String,
         weatherImage: String,
         temp: Int
    ) {
        self.time = time
        self.weatherImage = weatherImage
        self.temp = temp
    }
}

struct DaysForecastData: Hashable {
    var id = UUID()
    var day: String
    var imageName: String
    var lowTemp: Int
    var maxTemp: Int
    
    init(day: String,
         imageName: String,
         lowTemp: Int,
         maxTemp: Int
    ) {
        self.day = day
        self.imageName = imageName
        self.lowTemp = lowTemp
        self.maxTemp = maxTemp
    }
}
