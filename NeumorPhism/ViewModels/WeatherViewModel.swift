//
//  WeatherViewModel.swift
//  NeumorPhism
//
//  Created by Elliott Chkayben on 2021-02-20.
//

import SwiftUI

class WeatherViewModel: ObservableObject {
    @Published var weatherData: WeatherForecast
    
    init() {
        weatherData = WeatherForecast(todaysForecast: TodaysForecast(title: "", weatherImage: "", temp: 0, description: "", hourlyForecast: [HourlyForecast]()), daysForecastData: [DaysForecastData]())
        
        fetchDaysForecastData()
    }
    
    func fetchDaysForecastData() {
        let todaysForecast = TodaysForecast(title: "Broken Clouds", weatherImage: "cloud", temp: -4, description: "Feels like -9°", hourlyForecast: getHourlyForecast())
        weatherData = WeatherForecast(todaysForecast: todaysForecast, daysForecastData: getDaysForecast())
    }
    
    func getDaysForecast() -> [DaysForecastData] {
        [DaysForecastData(day: "Sunday",
                          imageName: "part-cloudy",
                          lowTemp: -3,
                          maxTemp: -9),
        DaysForecastData(day: "Monday",
                        imageName: "sunny",
                        lowTemp: 14,
                        maxTemp: 20),
        DaysForecastData(day: "Tuesday",
                        imageName: "part-cloudy",
                        lowTemp: 13,
                        maxTemp: 17),
        DaysForecastData(day: "Wednesday",
                        imageName: "cloudy",
                        lowTemp: 13,
                        maxTemp: 17),
        DaysForecastData(day: "Thursday",
                        imageName: "rainy",
                        lowTemp: 8,
                        maxTemp: 12),
        DaysForecastData(day: "Friday",
                        imageName: "rainy",
                        lowTemp: 7,
                        maxTemp: 12)]
    }
    
    func getHourlyForecast() -> [HourlyForecast] {
        [HourlyForecast(time: "10:00 AM", weatherImage: "cloudy", temp: -4),
         HourlyForecast(time: "11:00 AM", weatherImage: "cloudy", temp: -4),
         HourlyForecast(time: "12:00 PM", weatherImage: "part-cloudy", temp: -4),
         HourlyForecast(time: "1:00 PM", weatherImage: "rainy", temp: -3),
         HourlyForecast(time: "2:00 PM", weatherImage: "part-cloudy", temp: -3),
         HourlyForecast(time: "3:00 PM", weatherImage: "part-cloudy", temp: -4),
         HourlyForecast(time: "4:00 PM", weatherImage: "part-cloudy", temp: -4),
         HourlyForecast(time: "5:00 PM", weatherImage: "part-cloudy", temp: -5),
         HourlyForecast(time: "6:00 PM", weatherImage: "cloudy", temp: -6),
         HourlyForecast(time: "7:00 PM", weatherImage: "cloudy", temp: -7),
         HourlyForecast(time: "8:00 PM", weatherImage: "rainy", temp: -8),
         HourlyForecast(time: "8:00 PM", weatherImage: "rainy", temp: -8),
         HourlyForecast(time: "9:00 PM", weatherImage: "rainy", temp: -8),
         HourlyForecast(time: "10:00 PM", weatherImage: "cloudy", temp: -9),
         HourlyForecast(time: "11:00 PM", weatherImage: "cloudy", temp: -10),
        ]
    }
}
