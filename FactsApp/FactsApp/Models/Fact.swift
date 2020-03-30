//
//  Fact.swift
//  FactsApp
//
//  Created by Mable on 30/03/20.
//  Copyright © 2020 Mable. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Facts {
  
  var title: String
  var description: String
  var imageHref: String
  
  init(json:JSON) {
    title = json[APIKeys.title.rawValue].stringValue
    description = json[APIKeys.description.rawValue].stringValue
    imageHref = json[APIKeys.imageHref.rawValue].stringValue
  }
  
  /// Get facts array and filter out facts with empty title
  static func getFactsArray(factsArray: [JSON]) -> [Facts] {
    return factsArray.map { Facts(json: $0) }.filter{($0.title != emptyString)}
  }
  
}
