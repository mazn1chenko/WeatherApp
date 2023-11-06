//
//  NetworkServiveTests.swift
//  WeatherAppTests
//
//  Created by m223 on 19.10.2023.
//

import XCTest

@testable import WeatherApp

final class NetworkServiveTests: XCTestCase {
    
    var networkManager = NetworkManager.shared
    var networkServiceMock: NetworkServiceMockImpl!

    
    func testCreateUrlForChecking() {


        let apiKeyword = "Kharkiv"
        let url = networkManager.createUrlForChecking(apiKeyword)


        let expectedURL = "https://api.weatherapi.com/v1/current.json?key=c895a21f95aa4a50be4142537231910&q=Kharkiv&lang=uk"
        
        XCTAssertEqual(url, expectedURL, "Созданный URL не соответствует ожидаемому значению")
    }
    

    override func setUp() {
        super.setUp()
        networkServiceMock = NetworkServiceMockImpl()
        networkManager = NetworkManager()
        //networkManager. = networkServiceMock
    }
    
    func testGetIPAddress_Success() {
            networkServiceMock.result = .success(Data())
            
            let expectation = self.expectation(description: "Completion handler called")
            networkManager.getIPAddress { result in
                switch result {
                case .success(let ipAddress):
                    XCTAssertEqual(ipAddress, "192.166.133.23")
                case .failure:
                    XCTFail("Expected success, got failure")
                }
                expectation.fulfill()
            }

            waitForExpectations(timeout: 4.0, handler: nil)
        }
    
//    func testGetIPAddress_Failure() {
//        networkServiceMock.result = .failure(Error.self as! Error)
//
//        let expectation = self.expectation(description: "Completion handler called")
//        networkManager.getIPAddress { result in
//            switch result {
//            case .success:
//                XCTFail("Expected failure, got success")
//            case .failure(let error):
//                XCTAssertEqual(error.localizedDescription, "Expected error message")
//            }
//            expectation.fulfill()
//        }
//
//        waitForExpectations(timeout: 1.0, handler: nil)
//    }
    

}
    

