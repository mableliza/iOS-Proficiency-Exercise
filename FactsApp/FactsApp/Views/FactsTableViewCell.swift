//
//  FactsTableViewCell.swift
//  FactsApp
//
//  Created by Mable on 30/03/20.
//  Copyright © 2020 Mable. All rights reserved.
//

import UIKit
import SDWebImage

class FactsTableViewCell: UITableViewCell {
  
  private var titleLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont(name: titleFont, size: AppConstants.titleFontSize)
    label.textColor = AppColors.titleColor
    label.clipsToBounds = true
    label.numberOfLines = 0
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  private var descriptionLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont(name: descriptionFont, size: AppConstants.descriptionFontSize)
    label.textColor = AppColors.descriptionColor
    label.clipsToBounds = true
    label.numberOfLines = 0
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  private var factImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.clipsToBounds = true
    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.layer.cornerRadius = 10
    imageView.contentMode = .scaleAspectFit
    return imageView
  }()
  
  private let stackView: UIStackView = {
    let stackView = UIStackView()
    stackView.axis = .horizontal
    stackView.spacing = 5
    stackView.alignment = .top
    stackView.distribution = .fill
    stackView.translatesAutoresizingMaskIntoConstraints = false
    stackView.backgroundColor = .clear
    return stackView
  }()
  
  override func awakeFromNib() {
    super.awakeFromNib()
  }
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    contentView.addSubview(titleLabel)
    stackView.addArrangedSubview(descriptionLabel)
    stackView.addArrangedSubview(factImageView)
    contentView.addSubview(stackView)
    contentView.backgroundColor = AppColors.cellBackgroundColor
    setConstraints()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  /// Set the constraints for all the subviews
  func setConstraints() {
    let margins = contentView.layoutMarginsGuide
    titleLabel.topAnchor.constraint(equalTo:margins.topAnchor, constant: 5).isActive = true
    titleLabel.leadingAnchor.constraint(equalTo:margins.leadingAnchor, constant: 5).isActive = true
    titleLabel.trailingAnchor.constraint(equalTo:margins.trailingAnchor, constant: 5).isActive = true
    factImageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
    factImageView.heightAnchor.constraint(equalToConstant: 80).isActive = true
    stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: titleLabel.leadingAnchor, multiplier: 0).isActive = true
    stackView.trailingAnchor.constraint(equalToSystemSpacingAfter: titleLabel.trailingAnchor, multiplier: 0).isActive = true
    stackView.topAnchor.constraint(equalTo:titleLabel.bottomAnchor, constant: 10).isActive = true
    stackView.bottomAnchor.constraint(equalTo: margins.bottomAnchor, constant:  -10).isActive = true
  }
  
  /// Sets the data for the subviews.
  /// - Parameter fact: data object for the cell.
  func setData(fact:Facts) {
    self.titleLabel.text = fact.title
    self.descriptionLabel.text = fact.description
    self.factImageView.sd_setImage(with: URL(string: fact.imageHref), placeholderImage: #imageLiteral(resourceName: "placeholder"), options: [])
  }
  
}
