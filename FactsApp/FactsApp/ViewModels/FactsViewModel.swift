//
//  FactsViewModel.swift
//  FactsApp
//
//  Created by Mable on 08/04/20.
//  Copyright © 2020 Mable. All rights reserved.
//

import Foundation

protocol FactsDelegate: class {
  func getFactsSuccessful()
  func getFactsFailure(message: String)
}

class FactsViewModel {
  
  var country:Country?
  var delegate: FactsDelegate?
  
  /// Handles service call and set data
  func setData() {
    FactsAPI.shared.getFacts() { (success,country,message) in
      if success {
        self.country = country
        self.delegate?.getFactsSuccessful()
      } else {
        self.delegate?.getFactsFailure(message: message)
      }
    }
  }
  
  /// Gets title for thepage from data modell
  func getTitle() -> String {
    guard let country = self.country else {
      return emptyString
    }
    return country.title
  }
  
  /// Get the number of items in country data model for tableview listing
  func getNumberOfRows() -> Int {
    guard let country = self.country else {
      return 0
    }
    return country.facts.count
  }
  
}
