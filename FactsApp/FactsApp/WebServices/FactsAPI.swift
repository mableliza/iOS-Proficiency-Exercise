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
  let networking = BaseNetworking()
  typealias FactsResponse = (_ success: Bool, _ data: Any?, _ message: String) -> Void
  
  /// Calls API methods and passes the result in closure
  func getFacts(completionHandler: @escaping FactsResponse) {
    self.networking.callAPI(url: factsUrl, method: .GET) { (response, error, urlresponse) in
      guard let data = response else {
        completionHandler(false, nil, error?.localizedDescription ?? errorMsg)
        return
      }
      completionHandler(true, data, emptyString)
    }
  }
}
