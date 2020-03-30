//
//  BaseNetworking.swift
//  FactsApp
//
//  Created by Mable on 30/03/20.
//  Copyright © 2020 Mable. All rights reserved.
//

import Foundation
import SwiftyJSON

class BaseNetworking {
  
  private var session: URLSession!
  typealias CompletionHandler = (_ response: JSON?, _ error: Error?) -> Void
  typealias ResponseHandler = (_ data: JSON?) -> Void
  
  init() {
    session = URLSession(configuration: .default)
  }
  
  /// Crestes a data task to retrieve data from a url
  /// - Parameter url: url string to create request URL
  /// - Parameter url: url string to create request URL
  /// - Parameter handler: handler to call after the func is executed
  func callAPI(url: String,method:RequestMethod,handler: @escaping CompletionHandler ) {
    
    guard let url = URL(string: url) else { return }
    var request = URLRequest(url: url)
    request.httpMethod = method.rawValue
    request.setValue("application/json", forHTTPHeaderField: "Accept")
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    request.setValue("no-cache", forHTTPHeaderField: "Cache-Control")
    
    let dataTask = self.session.dataTask(with: request) { (data, response, error) in
      
      DispatchQueue.main.async {
        if let error = error {
          handler(nil,error)
        }
        guard let data = data else {
          handler(nil,error)
          return
        }
        self.handleResponseresponse(data: data) { data in
          handler(data, error)
        }
      }
    }
    dataTask.resume()
  }
  
  /// Creates json object from the data provided
  /// - Parameter data: the Data object for parsing json
  /// - Parameter responseHandler: gets called after function execution
  func handleResponseresponse(data: Data?, responseHandler: @escaping ResponseHandler) {
    if let data = data {
      if let value = String(data: data, encoding: String.Encoding.ascii) {
        if let jsonData = value.data(using: String.Encoding.utf8) {
          let json = JSON(jsonData)
          responseHandler(json)
        }
      }
    } else {
      responseHandler(nil)
    }
  }
  
}
