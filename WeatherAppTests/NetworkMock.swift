import Foundation
import UIKit
import XCTest

@testable import WeatherApp



protocol NetworkServiceMock: NetworkServiceMockImpl {
    var result: Result<Data, Error> { get set }
}

class NetworkServiceMockImpl: NetworkServiceMock {
    var result: Result<Data, Error> = .success(Data()) 
    
    func requestData(from url: URL, completion: @escaping (Result<Data, Error>) -> Void) {
        completion(result)
    }
}
