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
}
    

