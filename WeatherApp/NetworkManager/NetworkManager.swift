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
    
    var location = ""
    
    func createUrlForChecking(_ word: String) -> String{
        
        let tunnel = "https://"
        let server = "api.weatherapi.com/v1/"
        let endpoint = "current.json?key="
        let key = "c895a21f95aa4a50be4142537231910"
        let end = "&q="
        let daysAndLang = "&lang=uk"
        
        let url = tunnel + server + endpoint + key + end + word + daysAndLang

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
                    UserDefaults.standard.set(apiKeyword, forKey: "Location")
                
                case .failure(let error):
                    completion(.failure(error))
                    self.location = ""
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
            .validate()
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
    
//    func lastFetch(completion: @escaping (ConditionWeatherModel) -> (Void)) {
//
//        let weatherAPIURL = "https://www.weatherapi.com/docs/conditions.json"
//
//        AF.request(weatherAPIURL, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil, interceptor: nil)
//            .validate()
//            .response { response in
//                switch response.result {
//                case .success(let data):
//                    do {
//                        let jsonData = try JSONDecoder().decode(ConditionWeatherModel.self, from: (data ?? jsonDataa)!)
//                        completion(jsonData)
//
//                    } catch {
//                        print(error.localizedDescription)
//                    }
//                case .failure(let error):
//                    print(error)
//                }
//
//            }
//    }
    
    func getIPAddress(completion: @escaping (Result<String, Error>) -> Void) {
        let apiUrl = "https://api64.ipify.org?format=json"
        
        AF.request(apiUrl, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil, interceptor: nil)
            .response { response in
                switch response.result {
                case .success(let data):
                    if let jsonData = data {
                        do {
                            if let json = try JSONSerialization.jsonObject(with: jsonData, options: []) as? [String: Any], let ipAddress = json["ip"] as? String {
                                self.location = ipAddress
                                UserDefaults.standard.set(ipAddress, forKey: "FirstCurrentLocation")

                                print("working API")

                                completion(.success(ipAddress))
                            } else {
                                completion(.failure(NSError(domain: "ParsingError", code: 0, userInfo: [NSLocalizedDescriptionKey: "Failed to parse IP address from JSON"])))
                            }
                        } catch {
                            self.location = ""
                            print("Not working API")
                            completion(.failure(error))
                        }
                    } else {
                        completion(.failure(NSError(domain: "DataError", code: 0, userInfo: [NSLocalizedDescriptionKey: "Data is nil"])))
                    }
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }

}


//MARK: Creating personal urls for every method
extension NetworkManager {
    
    fileprivate func createUrlforCurrentWeather() -> String {
        
        let tunnel = "https://"
        let server = "api.weatherapi.com/v1/"
        let endpoint = "current.json?key="
        let key = "c895a21f95aa4a50be4142537231910"
        let end = "&q="
        var daysAndLang = ""
        if UserDefaults.standard.string(forKey: "AppLanguage") == "uk"{
            daysAndLang = "&lang=uk"
        }else{
            daysAndLang = "&lang=eu"
        }
        let url = tunnel + server + endpoint + key + end + location + daysAndLang
        return url
    }
    
    fileprivate func createUrlforForecastWeatherFor2Days() -> String {
        
        let tunnel = "https://"
        let server = "api.weatherapi.com/v1/"
        let endpoint = "forecast.json?key="
        let key = "c895a21f95aa4a50be4142537231910"
        let end = "&q="
        var daysAndLang = ""
        if UserDefaults.standard.string(forKey: "AppLanguage") == "uk"{
            daysAndLang = "&days=2&lang=uk"
        }else{
            daysAndLang = "&days=2&lang=eu"
        }
        let url = tunnel + server + endpoint + key + end + location + daysAndLang
        return url
    }
    

    fileprivate func createUrlforForecastWeatherFor7DaysUrl() -> String {
        
        let tunnel = "https://"
        let server = "api.weatherapi.com/v1/"
        let endpoint = "forecast.json?key="
        let key = "c895a21f95aa4a50be4142537231910"
        let end = "&q="
        let daysAndLang = "&days=7&lang=uk"
        let url = tunnel + server + endpoint + key + end + location + daysAndLang
        return url
    }
    
}

