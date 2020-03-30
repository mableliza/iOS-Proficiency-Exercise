//
//  Country.swift
//  FactsApp
//
//  Created by Mable on 30/03/20.
//  Copyright © 2020 Mable. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Country {
  
  var title: String
  var facts: [Facts]
  
  init(json:JSON) {
    title = json[APIKeys.title.rawValue].stringValue
    let factsArray = json[APIKeys.rows.rawValue].arrayValue
    facts = Facts.getFactsArray(factsArray: factsArray)
  }
  
}
