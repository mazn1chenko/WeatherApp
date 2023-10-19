//
//  NetworkServiveTests.swift
//  WeatherAppTests
//
//  Created by m223 on 19.10.2023.
//

import XCTest

@testable import WeatherApp

final class NetworkServiveTests: XCTestCase {
    
    func testCreateUrlForChecking() {

        let networkManager = NetworkManager.shared

        let apiKeyword = "Kharkiv"
        let url = networkManager.createUrlForChecking(apiKeyword)


        let expectedURL = "https://api.weatherapi.com/v1/current.json?key=c895a21f95aa4a50be4142537231910&q=Kharkiv&lang=uk"
        
        XCTAssertEqual(url, expectedURL, "Созданный URL не соответствует ожидаемому значению")
    }
    
    
//    func testFetchCurrentWeather_Success() {
//        // Создайте экземпляр NetworkManager
//        let networkManager = NetworkManager.shared
//
//        // Создайте JSON-подобные мок-данные в формате строки
//        let json = """
//        {
//          "location": {
//            "name": "Kharkiv",
//            "region": "Kharkivs'ka Oblast'",
//            "country": "Ukraine",
//            "lat": 50.0,
//            "lon": 36.25,
//            "tz_id": "Europe/Kiev",
//            "localtime_epoch": 1697729403,
//            "localtime": "2023-10-19 18:30"
//          },
//          "current": {
//            "last_updated_epoch": 1697729400,
//            "last_updated": "2023-10-19 18:30",
//            "temp_c": 8.7,
//            "temp_f": 47.7,
//            "is_day": 0,
//            "condition": {
//              "text": "Ясно",
//              "icon": "//cdn.weatherapi.com/weather/64x64/night/113.png",
//              "code": 1000
//            },
//            "wind_mph": 5.4,
//            "wind_kph": 8.6,
//            "wind_degree": 198,
//            "wind_dir": "SSW",
//            "pressure_mb": 1014.0,
//            "pressure_in": 29.95,
//            "humidity": 52,
//            "cloud": 8
//          }
//        }
//        """
//
//        if let jsonData = json.data(using: .utf8) {
//            // Создайте заглушку для Alamofire запроса, которая возвращает мок-данные
//            let mockSession = URLSessionMock(data: jsonData, response: nil, error: nil)
//            networkManager.session = mockSession
//
//            // Создайте ожидание для асинхронного вызова
//            let expectation = XCTestExpectation(description: "Ожидание успешного получения данных о погоде")
//
//            // Вызовите метод, который вы хотите протестировать
//            networkManager.fetchCurrentWeather { currentWeatherModel in
//                // Проверьте, что полученная модель данных о погоде не пустая
//                XCTAssertNotNil(currentWeatherModel, "Модель данных о погоде не должна быть пустой")
//
//                // Завершите ожидание
//                expectation.fulfill()
//            }
//
//            // Дождитесь завершения асинхронного вызова (максимум 10 секунд)
//            wait(for: [expectation], timeout: 10)
//        } else {
//            XCTFail("Ошибка создания мок-данных")
//        }
//    }
}
    

