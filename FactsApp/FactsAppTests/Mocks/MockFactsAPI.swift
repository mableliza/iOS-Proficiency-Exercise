//
//  MockFactsAPI.swift
//  FactsAppTests
//
//  Created by Mable on 02/04/20.
//  Copyright © 2020 Mable. All rights reserved.
//

import Foundation
import SwiftyJSON
@testable import FactsApp

class MockFactsAPI {
  
  var shouldReturnError = false
  typealias FactsResponse = (_ success: Bool, _ data: Country?, _ message: String) -> Void
  
  convenience init() {
    self.init(false)
  }
  
  init(_ shouldReturnError: Bool) {
    self.shouldReturnError = shouldReturnError
  }
  
  let mockFactsResponse: [String: Any] = [
    "title":"About Canada",
    "rows": [
      [
        "title":"Beavers",
        "description":"Beavers are second only to humans in their ability to manipulate and change their environment. They can measure up to 1.3 metres long. A group of beavers is called a colony",
        "imageHref":"http://upload.wikimedia.org/wikipedia/commons/thumb/6/6b/American_Beaver.jpg/220px-American_Beaver.jpg"
      ],
      [
        "title":"Transportation",
        "description":"It is a well known fact that polar bears are the main mode of transportation in Canada. They consume far less gas and have the added benefit of being difficult to steal.",
        "imageHref":"http://1.bp.blogspot.com/_VZVOmYVm68Q/SMkzZzkGXKI/AAAAAAAAADQ/U89miaCkcyo/s400/the_golden_compass_still.jpg"
      ],
      [
        "title":"Hockey Night in Canada",
        "description":"These Saturday night CBC broadcasts originally aired on radio in 1931. In 1952 they debuted on television and continue to unite (and divide) the nation each week.",
        "imageHref":"http://fyimusic.ca/wp-content/uploads/2008/06/hockey-night-in-canada.thumbnail.jpg"
      ]
    ]
  ]
  
  /// This methods mocks the getFacts method in FactsAPI.
  func getFacts(completionHandler: @escaping FactsResponse) {
    if shouldReturnError {
      completionHandler(false,nil,"")
    } else {
      let json = JSON(mockFactsResponse)
      let country = Country(json: json)
      completionHandler(true,country,"")
    }
  }
}

