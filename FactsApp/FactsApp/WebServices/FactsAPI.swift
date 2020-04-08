//
//  FactsAPI.swift
//  FactsApp
//
//  Created by Mable on 30/03/20.
//  Copyright © 2020 Mable. All rights reserved.
//

import Foundation

class FactsAPI {
  
  static let shared = FactsAPI()
  var networking = BaseNetworking()
  typealias FactsResponse = (_ success: Bool, _ data: Country?, _ message: String) -> Void
  
  /// Calls API methods and passes the result in closure
  func getFacts(completionHandler: @escaping FactsResponse) {
    self.networking.callAPI(url: factsUrl, method: .GET) { (data, error) in
      guard let data = data else {
        completionHandler(false, nil, error?.localizedDescription ?? errorMsg)
        return
      }
      let country = Country(json: data)
      completionHandler(true, country, emptyString)
    }
  }
}
