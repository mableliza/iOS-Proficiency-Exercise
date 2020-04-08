//
//  MockURLSessionFailure.swift
//  FactsAppTests
//
//  Created by Mable on 08/04/20.
//  Copyright © 2020 Mable. All rights reserved.
//

import Foundation

class MockURLSessionFailure: URLSession {
  
  override func dataTask(with request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
    completionHandler(nil, URLResponse(), RandomError.invalidSelection)
    return CustomDataTask()
  }
  
}

class CustomDataTask: URLSessionDataTask {
  
  override func resume() {
  }
  
}

enum RandomError: Error {
  case invalidSelection
  case noInternet
}
