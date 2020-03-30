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
  lazy var refreshControl: UIRefreshControl = {
    let refreshControl = UIRefreshControl()
    refreshControl.addTarget(self, action: #selector(self.handleRefresh(_:)),for: .valueChanged)
    refreshControl.tintColor = AppColors.refreshTintColor
    return refreshControl
  }()
  
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
    tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
    tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    tableView.dataSource = self
    tableView.tableFooterView = UIView()
    tableView.rowHeight = UITableView.automaticDimension
    tableView.estimatedRowHeight = AppConstants.rowHeight
    tableView.rowHeight = UITableView.automaticDimension
    tableView.showsVerticalScrollIndicator = false
    tableView.refreshControl = refreshControl
    tableView.register(FactsTableViewCell.self, forCellReuseIdentifier: cellIdentifier)
    tableView.reloadData()
  }
  
  /// Gets the data from service call and reloads the tableview
  func setData() {
    FactsAPI.shared.getFacts() { (success,country,message) in
      self.refreshControl.endRefreshing()
      if success {
        self.country = country
        self.title = country?.title
      } else {
        self.showErrorAlert(message: message)
      }
      self.tableView.reloadData()
    }
  }
  
  /// Tableview refresh method
  @objc private func handleRefresh(_ refresh: UIRefreshControl) {
    setData()
  }
  
  /// Get an alertviewcontroller to show eoor message when network request returns an error
  func showErrorAlert(message: String) {
    let alertVC = UIAlertController(title: nil, message: message, preferredStyle: .alert)
    alertVC.addAction(UIAlertAction(title: ok, style: .default))
    self.present(alertVC, animated: true)
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
    let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! FactsTableViewCell
    cell.setData(fact: country!.facts[indexPath.row])
    return cell
  }
}
