//
//  NowWeatherSummary.swift
//  NeumorPhism
//
//  Created by Elliott Chkayben on 2021-02-21.
//

import SwiftUI

struct NowWeatherSummary: View {
    @ObservedObject var viewModel: WeatherViewModel
    
    var body: some View {
        Group {
            HStack {
                VStack {
                    Text(viewModel.weatherData.todaysForecast.title)
                        .font(.headline)
                        .fontWeight(.medium)
                    
                    Text(viewModel.weatherData.todaysForecast.temp.degreesToString())
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(.top, 8)
                    
                    
                    Text(viewModel.weatherData.todaysForecast.description)
                        .foregroundColor(Color.secondaryColor)
                        .font(.caption)
                }
                .frame(width: 200, height: 150)
                
                Spacer()
                
                Image("cloudy")
                    .resizable()
                    .frame(width: 100, height: 70, alignment: .center)
                    .padding(.trailing, 16)
            }
        }
    }
}
