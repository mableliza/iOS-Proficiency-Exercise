//
//  FactsAppMockDataTests.swift
//  FactsAppTests
//
//  Created by Mable on 02/04/20.
//  Copyright © 2020 Mable. All rights reserved.
//

import XCTest
@testable import FactsApp

class FactsAppMockDataTests: XCTestCase {
  
  func testFactsAPISuccess() {
    let factsAPI = MockFactsAPI()
    factsAPI.getFacts() { (success, country, message ) in
      XCTAssertNotNil(country)
    }
  }
  
  func testFactsAPIFailure() {
    let factsAPI = MockFactsAPI(true)
    factsAPI.getFacts() { (success, country, message ) in
      XCTAssertNil(country)
    }
  }
}
