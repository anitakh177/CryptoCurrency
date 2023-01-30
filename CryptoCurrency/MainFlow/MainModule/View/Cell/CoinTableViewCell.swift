//
//  CoinTableViewCell.swift
//  CryptoCurrency
//
//  Created by anita on 1/30/23.
//

import UIKit

final class CoinTableViewCell: UITableViewCell {
    
    // MARK: - Views
    private let titleLabel = LabelConstructor().createLabel(font: .systemFont(ofSize: 17, weight: .medium),
                                                            alignment: .left, text: "")
    private let priceLabel = LabelConstructor().createLabel(font: .systemFont(ofSize: 17, weight: .medium),
                                                            alignment: .center, text: "")
    private let priceChangeLabel =  LabelConstructor().createLabel(font: .systemFont(ofSize: 17, weight: .medium),
                                                                   alignment: .right, text: "")
    
    private var iconImageView: UIImageView = {
        let image = UIImageView(frame: CGRect(x: 0, y: 0, width: 65, height: 65))
        image.contentMode = .scaleAspectFit
        image.layer.cornerRadius = image.frame.size.width / 2
        image.clipsToBounds = true
        image.layer.masksToBounds = false
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private var roundedView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
        view.layer.borderWidth = 1
        view.layer.borderColor = Colors.darkPurpleColor.cgColor
        view.backgroundColor =  Colors.darkPurpleColor.withAlphaComponent(0.8)
        view.translatesAutoresizingMaskIntoConstraints = false
       
        return view
    }()
    
    private lazy var stackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [titleLabel, priceLabel, priceChangeLabel])
        stack.axis = .horizontal
        stack.distribution = .fill
        stack.alignment = .fill
        stack.spacing = 8
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    
    // MARK: - Initialization
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(roundedView)
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
    
    func configureDataSource(coin: Crypto) {
        let coinIcons = CoinIcons()
        let icon = coinIcons.getIconWithID(with: coin.data.id)
        iconImageView.image = UIImage(named: icon)
        titleLabel.text = coin.data.name
        priceLabel.text = coin.data.marketData.priceUsd?.convertNumber()
        
    }
    
    func configurePriceChange(priceChange: Double) {
        let changeIn24Hours = priceChange.convertPercent()
        priceChangeLabel.text = changeIn24Hours + "%"
        if changeIn24Hours.contains("-") {
            priceChangeLabel.textColor = .red
        }
        else if changeIn24Hours == "0" {
            priceChangeLabel.textColor = .white
        }
        else {
            priceChangeLabel.textColor = Colors.greenColor
        }
       

    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        priceLabel.text = nil
        priceChangeLabel.text = nil
        titleLabel.text = nil
        iconImageView.image = nil
    }
}

// MARK: - Private Methods

private extension CoinTableViewCell {
    
    func setConstraints() {
        roundedView.addSubview(stackView)
        roundedView.addSubview(iconImageView)
      
        NSLayoutConstraint.activate([
            roundedView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            roundedView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: ItemViewInset.leftDistanceToView),
            roundedView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -ItemViewInset.rightDistanceToView),
            roundedView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
            
            iconImageView.centerYAnchor.constraint(equalTo: roundedView.centerYAnchor),
            iconImageView.leadingAnchor.constraint(equalTo: roundedView.leadingAnchor, constant: 8),
            iconImageView.widthAnchor.constraint(equalToConstant: 65),
            iconImageView.heightAnchor.constraint(equalToConstant: 65),
            
            stackView.topAnchor.constraint(equalTo: roundedView.topAnchor, constant: 5),
            stackView.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: roundedView.trailingAnchor, constant: -8),
            stackView.bottomAnchor.constraint(equalTo: roundedView.bottomAnchor, constant: -5)
            
        ])
        
        titleLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        priceChangeLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
       
    }
    
}

