//
//  NetworkWeatherManager.swift
//  WezApp
//
//  Created by Andrew Boldyrev on 12.08.2020.
//  Copyright © 2020 Andrew Boldyrev. All rights reserved.
//

import Foundation


struct NetworkWeatherManager {
    
    func fetchCurrentWeather(forCity city: String) {
        
        let urlString = "https://api.openweathermap.org/data/2.5/weather?q=\(city)&apikey=\(apiKey)"
        guard let url = URL(string: urlString) else { return }
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { (data, response, error) in
            if let data = data {
                self.parseJSON(withData: data)
            }
        }
        task.resume()
    }
    
    func parseJSON(withData data: Data ) {
        let decoder = JSONDecoder()
        
        decoder.decode(CurrentWeatherData.self, from: data)
    }
}
