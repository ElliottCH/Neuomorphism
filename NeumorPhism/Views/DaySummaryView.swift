//
//  ContentView.swift
//  NeumorPhism
//
//  Created by Elliott Chkayben on 2021-02-19.
//

import SwiftUI

struct DaySummaryView: View {
    var forecast: DaysForecastData
  
  var body: some View {
    ZStack {
        RoundedRectangle(cornerRadius: 20)
                        .fill(Color.background)
                        .frame(width: UIScreen.main.bounds.width - 16, height: 60)
            .shadow(color: Color.lightShadow, radius: 8, x: -8, y: -8)
            .shadow(color: Color.darkShadow, radius: 8, x: 8, y: 8)
        
        HStack {
          Text(forecast.day)
            .fontWeight(.medium)
          Spacer()
          Text("\(forecast.maxTemp.degreesToString()) / \(forecast.lowTemp.degreesToString())")
            .fontWeight(.light)
          Image(forecast.imageName)
            .imageScale(.large)
            .foregroundColor(.secondary)
        }
        .padding([.leading, .trailing], 16)
    }
    .frame(width: UIScreen.main.bounds.width, height: 80)
  }
}
