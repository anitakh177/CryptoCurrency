//
//  DetailInfoTableCollectionCell.swift
//  CryptoCurrency
//
//  Created by anita on 1/30/23.
//

import UIKit

final class DetailInfoTableCollectionCell: UITableViewCell {
    
    // MARK: - Views
    
    private let titleLabel = LabelConstructor().createLabel(font: .systemFont(ofSize: 18, weight: .semibold),
                                                            alignment: .left, text: "")
    private let metricLabel = LabelConstructor().createLabel(font: .systemFont(ofSize: 18, weight: .semibold),
                                                             alignment: .right, text: "")
    
    // MARK: - Initialization
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews()
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
    
    func configureDataSource(metric: KeyMetricsModel) {
        titleLabel.text = metric.title
        metricLabel.text = metric.number
    }
}

// MARK: - Private Methods

private extension DetailInfoTableCollectionCell {
    
    func addSubviews() {
        contentView.addSubview(titleLabel)
        contentView.addSubview(metricLabel)
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: ItemViewInset.leftDistanceToView),
            titleLabel.trailingAnchor.constraint(equalTo: metricLabel.leadingAnchor, constant: ItemViewInset.rightDistanceToView),
            
            metricLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            metricLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -ItemViewInset.rightDistanceToView)
        ])
        titleLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
    }
}

