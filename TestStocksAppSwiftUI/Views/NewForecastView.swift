//
//  NewForecastView.swift
//  TestWeatherAppSwiftUI
//
//  Created by Max Chesnikov on 18.02.2021.
//

import SwiftUI

struct NewForecastView: View {
    let forecast: Forecast
    
    var body: some View {
        VStack {
            HStack(alignment: .center, spacing: 4) {
                Text(forecast.name ?? "")
                    .foregroundColor(.black)
                    .font(.system(size: 38, weight: .semibold))
                Spacer()
                HStack {
                    Text(forecast.forecastDescription ?? "")
                        .foregroundColor(.gray)
                        .font(.system(size: 28, weight: .semibold))
                }
            }
            .padding()
            Spacer()
            Text(convertTemp(temp: Double(forecast.temperature!), from: .fahrenheit, to: .celsius))
                .foregroundColor(.black)
                .font(.system(size: 78, weight: .semibold))
        }
    }
}

struct NewForecastView_Previews: PreviewProvider {
    static var previews: some View {
        ForecastView(forecast: Forecast.dummyData)
            .previewLayout(.sizeThatFits)
    }
}

