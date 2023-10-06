//
//  NetworkManager.swift
//  WeatherApp
//
//  Created by m223 on 05.10.2023.
//

import Foundation
import Alamofire

class NetworkManager {
    
    static let shared = NetworkManager()
    
    let currentWeatherUrl = "https://api.weatherapi.com/v1/current.json?key=8168b1aed18f4e6caf6110333230510&q=Kharkiv"
    let forecastWeatherUrl = "https://api.weatherapi.com/v1/forecast.json?key=8168b1aed18f4e6caf6110333230510&q=Kharkiv&days=2"
    
    func fetchCurrentWeather(completion: @escaping (CurrentWeatherModel) -> (Void)) {
        
        AF.request(currentWeatherUrl, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil, interceptor: nil)
            .response { responce in
                switch responce.result {
                case .success(let data):
                    do {
                        let jsonData = try JSONDecoder().decode(CurrentWeatherModel.self, from: data!)
//                        print(jsonData)
                        completion(jsonData)
                    }catch {
                        
                        print(error.localizedDescription)
                    }
                case .failure(let error):
                    print(error)
                }
                
            }

    }
    func fetchForecastWeatherFor7Days(completion: @escaping (ForecastWeatherModel) -> (Void)) {

        AF.request(forecastWeatherUrl, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil, interceptor: nil)
            .response { responce in
                switch responce.result {
                case .success(let data):
                    do {
                        let jsonData = try JSONDecoder().decode(ForecastWeatherModel.self, from: data!)
                        completion(jsonData)

                    }catch {

                        print(error.localizedDescription)
                    }
                case .failure(let error):
                    print(error)
                }

            }

    }
}


