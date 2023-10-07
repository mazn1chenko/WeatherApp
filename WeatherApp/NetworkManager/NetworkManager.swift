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
    
    var location = "London"
    
    func createUrlForChecking(_ word: String) -> String{
        
        let tunnel = "https://"
        let server = "api.weatherapi.com/v1/"
        let endpoint = "current.json?key="
        let key = "8168b1aed18f4e6caf6110333230510"
        let end = "&q="
        let daysAndLang = "&lang=uk"
        let url = tunnel + server + endpoint + key + end + word + daysAndLang
        return url

    }
    func createUrlforCurrentWeather() -> String {
        
        let tunnel = "https://"
        let server = "api.weatherapi.com/v1/"
        let endpoint = "current.json?key="
        let key = "8168b1aed18f4e6caf6110333230510"
        let end = "&q="
        let daysAndLang = "&lang=uk"
        let url = tunnel + server + endpoint + key + end + location + daysAndLang
       // print(url)
        return url
    }
    
    func createUrlforForecastWeatherFor2Days() -> String {
        
        let tunnel = "https://"
        let server = "api.weatherapi.com/v1/"
        let endpoint = "forecast.json?key="
        let key = "8168b1aed18f4e6caf6110333230510"
        let end = "&q="
        let daysAndLang = "&days=2&lang=uk"
        let url = tunnel + server + endpoint + key + end + location + daysAndLang
        //print(url)
        return url
    }
    


    func createUrlforForecastWeatherFor7DaysUrl() -> String {
        
        let tunnel = "https://"
        let server = "api.weatherapi.com/v1/"
        let endpoint = "forecast.json?key="
        let key = "8168b1aed18f4e6caf6110333230510"
        let end = "&q="
        let daysAndLang = "&days=7&lang=uk"
        let url = tunnel + server + endpoint + key + end + location + daysAndLang
        //print(url)
        return url
    }
    
    func checkAPIStatus(apiKeyword: String, completion: @escaping (Result<Int, Error>) -> Void) {

        let apiUrl = createUrlForChecking(apiKeyword)
        
        AF.request(apiUrl, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil, interceptor: nil)
            .response { response in
                switch response.result {
                case .success:
                    completion(.success(1))
                    self.location = apiKeyword
                case .failure(let error):
                    completion(.failure(error))
                    self.location = "London"
                }
            }
    }
        
    func fetchCurrentWeather(completion: @escaping (CurrentWeatherModel) -> (Void)) {
        
        AF.request(createUrlforCurrentWeather(), method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil, interceptor: nil)
            .response { responce in
                switch responce.result {
                case .success(let data):
                    do {
                        let jsonData = try JSONDecoder().decode(CurrentWeatherModel.self, from: data!)
                        completion(jsonData)
                    }catch {
                        
                        print(error.localizedDescription)
                    }
                case .failure(let error):
                    print(error)
                }
                
            }

    }
    func fetchForcatsWeatherFor2Days(completion: @escaping (ForecastWeatherModel) -> (Void)) {

        AF.request(createUrlforForecastWeatherFor2Days(), method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil, interceptor: nil)
            .response { responce in
                switch responce.result {
                case .success(let data):
                    do {
                        let jsonData = try JSONDecoder().decode(ForecastWeatherModel.self, from: data!)
                        completion(jsonData)

                    }catch {
                        print("Here")
                        print(error.localizedDescription)
                    }
                case .failure(let error):
                    print("Herelol")
                    print(error)
                }

            }

    }
    
    func fetchForcatsWeatherFor7Days(completion: @escaping (ForecastWeatherModel) -> (Void)) {

        AF.request(createUrlforForecastWeatherFor7DaysUrl(), method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil, interceptor: nil)
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


