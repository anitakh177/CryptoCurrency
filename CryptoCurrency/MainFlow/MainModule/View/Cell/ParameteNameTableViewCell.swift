//
//  ParameteNameTableViewCell.swift
//  CryptoCurrency
//
//  Created by anita on 1/30/23.
//

import UIKit

final class ParameteNameTableViewCell: UITableViewCell {
    
    
    // MARK: - Views
    
    private let nameLabel = LabelConstructor().createLabel(font: .systemFont(ofSize: 16, weight: .semibold), alignment: .center, text: "Name")
    private let priceLabel = LabelConstructor().createLabel(font: .systemFont(ofSize: 16, weight: .semibold), alignment: .center, text: "Price USD")
                                                         
    private let priceChange = LabelConstructor().createLabel(font: .systemFont(ofSize: 16, weight: .semibold), alignment: .center, text: "")
    
    // MARK: - Initialization
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(nameLabel)
        contentView.addSubview(priceLabel)
        contentView.addSubview(priceChange)
      
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Layout
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setConstraints()
    }
    
    // MARK: - Open Methods
    
    func configurePriceChangeLabel(title: String) {
        priceChange.text = title
    }

}

// MARK: - Private Methods

private extension ParameteNameTableViewCell {
    
    func setConstraints() {
      
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 60),
            nameLabel.widthAnchor.constraint(equalToConstant: 70),
            
            priceLabel.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor, constant: 80),
            priceLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            priceLabel.widthAnchor.constraint(equalToConstant: 100),
            
            priceChange.leadingAnchor.constraint(equalTo: priceLabel.trailingAnchor, constant: ItemViewInset.leftDistanceToView),
            priceChange.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            priceChange.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -ItemViewInset.rightDistanceToView)
            
        ])
    }
}

