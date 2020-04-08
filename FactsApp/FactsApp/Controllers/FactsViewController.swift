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
  var viewModel: FactsViewModel!
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
    setViewModel()
    setupTableview()
    setData()
  }
  
  /// Initialise viewModel and add delegate
  func setViewModel() {
    self.viewModel = FactsViewModel()
    viewModel.delegate = self
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
  
  /// Calls viewModel to initiate network call
  func setData() {
    viewModel.setData()
  }
  
  /// Handles title for the page
  func setTitle() {
    self.title = viewModel.getTitle()
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
    return viewModel.getNumberOfRows()
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! FactsTableViewCell
    cell.setData(fact: viewModel.country!.facts[indexPath.row])
    return cell
  }
}

//MARK:- ViewModel delegate methods
extension FactsViewController: FactsDelegate {
  
  /// Handles API success
  func getFactsSuccessful() {
    self.refreshControl.endRefreshing()
    setTitle()
    tableView.reloadData()
  }
  
  ///Handles API call failure
  func getFactsFailure(message: String) {
    self.refreshControl.endRefreshing()
    self.showErrorAlert(message: message)
    tableView.reloadData()
  }
  
}
