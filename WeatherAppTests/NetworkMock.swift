//
//  NetworkMock.swift
//  WeatherAppTests
//
//  Created by m223 on 19.10.2023.
//

//import Foundation
//
//class URLSessionMock: URLSession {
//    var data: Data?
//    var response: URLResponse?
//    var error: Error?
//
//    init(data: Data?, response: URLResponse?, error: Error?) {
//        self.data = data
//        self.response = response
//        self.error = error
//    }
//
//    override func dataTask(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
//        let task = URLSessionDataTaskMock()
//        task.completionHandler = completionHandler
//
//        // В этом методе вы можете имитировать работу data task и передавать мок-данные, response и ошибку в обработчик completionHandler.
//
//        return task
//    }
//}
//
//class URLSessionDataTaskMock: URLSessionDataTask {
//    var completionHandler: ((Data?, URLResponse?, Error?) -> Void)?
//
//    override func resume() {
//        // Здесь вы можете вызвать completionHandler с вашими мок-данными, response и ошибкой.
//        completionHandler?(data, response, error)
//    }
//}
