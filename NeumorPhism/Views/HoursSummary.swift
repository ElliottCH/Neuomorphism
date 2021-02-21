//
//  HoursSummary.swift
//  NeumorPhism
//
//  Created by Elliott Chkayben on 2021-02-21.
//

import SwiftUI

struct HoursSummary: View {
    var forecast: HourlyForecast
    
    var body: some View {
        VStack {
            Text(forecast.time)
                .font(.body)
                .fontWeight(.regular)
            
            Text(forecast.temp.degreesToString())
                .font(.headline)
                .fontWeight(.bold)
            
            Image(forecast.weatherImage)
                .resizable()
                .frame(width: 40, height: 30, alignment: .center)
                .padding(.bottom, 8)
        }
        .frame(width: 120, height: 120)
        .softInnerShadow(RoundedRectangle(cornerRadius: 15.0), darkShadow: Color.darkShadow, lightShadow: Color.lightShadow, spread: 0.5)
        .padding(.leading, 8)
    }
}
