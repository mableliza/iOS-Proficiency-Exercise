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
  
  /// Static  data for tableview
  var titles = ["Beavers","Transportation","Hockey Night in Canada","Eh","Housing"]
  var descriptions:[String] = ["Beavers are second only to humans in their ability to manipulate and change their environment. They can measure up to 1.3 metres long. A group of beavers is called a colony","It is a well known fact that polar bears are the main mode of transportation in Canada. They consume far less gas and have the added benefit of being difficult to steal.","These Saturday night CBC broadcasts originally aired on radio in 1931. In 1952 they debuted on television and continue to unite (and divide) the nation each week.","A chiefly Canadian interrogative utterance, usually expressing surprise or doubt or seeking confirmation.","Warmer than you might think."]
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    self.title = "Canada"
    self.view.backgroundColor = .white
    setupTableview()
    
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
    tableView.rowHeight = UITableView.automaticDimension
    tableView.estimatedRowHeight = 80
    tableView.rowHeight = UITableView.automaticDimension
    tableView.showsVerticalScrollIndicator = false
    tableView.reloadData()
  }
  
}

extension FactsViewController: UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return titles.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
    cell.textLabel?.text = titles[indexPath.row]
    cell.detailTextLabel?.numberOfLines = 0
    cell.detailTextLabel?.text = descriptions[indexPath.row]
    return cell
  }
}
