//
//  WeatherForecastView.swift
//  NeumorPhism
//
//  Created by Elliott Chkayben on 2021-02-21.
//

import SwiftUI

struct WeatherForecastView: View {
    @ObservedObject var viewModel: WeatherViewModel
    
    init() {
        self.viewModel = WeatherViewModel()
    }
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.background)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                
                LocationView()
                
                NowWeatherSummary(viewModel: viewModel)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack() {
                        ForEach(self.viewModel.weatherData.todaysForecast.hourlyForecast, id: \.self) {
                            HoursSummary(forecast: $0)
                        }
                    }
                }
                .padding(.top, 16)
                
                ScrollView(.vertical, showsIndicators: false) {
                    VStack {
                        ForEach(self.viewModel.weatherData.daysForecastData, id: \.self) {
                            DaySummaryView(forecast: $0)
                        }
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherForecastView()
        
        WeatherForecastView()
            .environment(\.colorScheme, .dark)
    }
}
