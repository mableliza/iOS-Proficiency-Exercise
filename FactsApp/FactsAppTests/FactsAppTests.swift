//
//  FactsAppTests.swift
//  FactsAppTests
//
//  Created by Mable on 02/04/20.
//  Copyright © 2020 Mable. All rights reserved.
//

import XCTest
@testable import FactsApp

class FactsAppTests: XCTestCase {
  var viewController: FactsViewController!
  
    override func setUp() {
        viewController = FactsViewController()
      _ = viewController.view
    }

    override func tearDown() {
        viewController = nil
    }

  func testHasTableview() {
     XCTAssertNotNil(viewController.tableView)
   }
   
   func testTableDataSource() {
     XCTAssert(viewController.tableView.dataSource is FactsViewController)
   }
   
   func testTableCellsForNoData() {
    viewController.viewModel.country = nil
     let cellCount = viewController.tableView.numberOfRows(inSection: 0)
     XCTAssert(cellCount == 0)
   }
  

}
