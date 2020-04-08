//
//  FactsViewModelTests.swift
//  FactsAppTests
//
//  Created by Mable on 08/04/20.
//  Copyright © 2020 Mable. All rights reserved.
//

import XCTest
import SwiftyJSON
@testable import FactsApp

class FactsViewModelTests: XCTestCase {
  
  var viewModel: FactsViewModel!
  var testData: [String: Any] = [
    "title":"About Canada",
    "rows": [
      [
        "title":"Beavers",
        "description":"Beavers are second only to humans in their ability to manipulate and change their environment. They can measure up to 1.3 metres long. A group of beavers is called a colony",
        "imageHref":"http://upload.wikimedia.org/wikipedia/commons/thumb/6/6b/American_Beaver.jpg/220px-American_Beaver.jpg"
      ],
      [
        "title":"Hockey Night in Canada",
        "description":"These Saturday night CBC broadcasts originally aired on radio in 1931. In 1952 they debuted on television and continue to unite (and divide) the nation each week.",
        "imageHref":"http://fyimusic.ca/wp-content/uploads/2008/06/hockey-night-in-canada.thumbnail.jpg"
      ]
    ]
  ]
  var country: Country!
  
  override func setUp() {
    viewModel = FactsViewModel()
    let json = JSON(testData)
    country = Country(json: json)
    
  }
  
  override func tearDown() {
    viewModel = nil
  }
  
  func testGetTitle() {
    viewModel.country = nil
    let title = viewModel.getTitle()
    XCTAssert(title == "", "Title should not be nil, it should return emty string if no data model is nil")
  }
  
  func testGetTitleWithData() {
    viewModel.country = country
    let title = viewModel.getTitle()
    XCTAssert(title == "About Canada", "Title shouild match the test data")
  }
  
  func testNumberOfRows() {
    viewModel.country = nil
    let numberOfRows = viewModel.getNumberOfRows()
    XCTAssert(numberOfRows == 0, "When the data model is nil, number of rows is 0")
  }
  
  func testNumberOfRowsWithData() {
    viewModel.country = country
    let numberOfRows = viewModel.getNumberOfRows()
    XCTAssert(numberOfRows == 2, "The number of rows should match the data")
  }
  
}
