//
//  FactsViewController.swift
//  FactsApp
//
//  Created by Mable on 30/03/20.
//  Copyright © 2020 Mable. All rights reserved.
//

import UIKit

class FactsViewController: UIViewController {
  
  let tableView = UITableView()
  var country:Country?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    self.view.backgroundColor = .white
    setupTableview()
    setData()
  }
  
  /// Setup tableview properties and constraints
  func setupTableview() {
    self.view.addSubview(tableView)
    let layoutMargins = view.layoutMarginsGuide
    tableView.translatesAutoresizingMaskIntoConstraints = false
    tableView.topAnchor.constraint(equalTo: layoutMargins.topAnchor).isActive = true
    tableView.bottomAnchor.constraint(equalTo: layoutMargins.bottomAnchor).isActive = true
    tableView.leadingAnchor.constraint(equalTo: layoutMargins.leadingAnchor).isActive = true
    tableView.trailingAnchor.constraint(equalTo: layoutMargins.trailingAnchor).isActive = true
    tableView.dataSource = self
    tableView.tableFooterView = UIView()
    tableView.rowHeight = UITableView.automaticDimension
    tableView.estimatedRowHeight = AppConstants.rowHeight
    tableView.rowHeight = UITableView.automaticDimension
    tableView.showsVerticalScrollIndicator = false
    tableView.reloadData()
  }
  
  /// Gets the data from service call and reloads the tableview
  func setData() {
    FactsAPI.shared.getFacts() { (success,country,message) in
      if success {
        self.country = country
        self.title = country?.title
      }
      self.tableView.reloadData()
    }
  }
  
}

//MARK:- Tableview datasource methods
extension FactsViewController: UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    guard let country = self.country else {
      return 0
    }
    return country.facts.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
    cell.detailTextLabel?.numberOfLines = 0
    cell.textLabel?.text = country?.facts[indexPath.row].title
    cell.detailTextLabel?.text = country?.facts[indexPath.row].description
    return cell
  }
}
