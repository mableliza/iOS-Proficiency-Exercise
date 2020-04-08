//
//  FactsAppURLSessionTests.swift
//  FactsAppTests
//
//  Created by Mable on 08/04/20.
//  Copyright © 2020 Mable. All rights reserved.
//

import XCTest
@testable import FactsApp

class FactsAppURLSessionTests: XCTestCase {
  
  func testAPISuccess(){
    let expectation = self.expectation(description: "api")
    let factsAPI = FactsAPI()
    factsAPI.networking = MockBaseNetworking<MockURLSessionSuccess>()
    factsAPI.getFacts(){ (success, country, message ) in
      XCTAssertNotNil(country)
      expectation.fulfill()
    }
    waitForExpectations(timeout: 5, handler: nil)
  }
  
  func testAPIFailure(){
    let expectation = self.expectation(description: "api")
    let factsAPI = FactsAPI()
    factsAPI.networking = MockBaseNetworking<MockURLSessionFailure>()
    factsAPI.getFacts(){ (success, country, message ) in
      XCTAssertNil(country)
      expectation.fulfill()
    }
    waitForExpectations(timeout: 5, handler: nil)
  }
}
