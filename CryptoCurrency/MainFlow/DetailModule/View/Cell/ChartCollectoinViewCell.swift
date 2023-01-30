//
//  ChartCollectoinViewCell.swift
//  CryptoCurrency
//
//  Created by anita on 1/30/23.
//

import UIKit
import SwiftUI

final class ChartCollectoinViewCell: UITableViewCell {
    var gradient = Gradient()
    func host<Content: View>(_ hostingController: UIHostingController<Content>) {
        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        hostingController.view.backgroundColor = .clear
        separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: UIScreen.main.bounds.width)
        
        addSubview(hostingController.view)

        let constraints = [
            hostingController.view.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            hostingController.view.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: ItemViewInset.leftDistanceToView),
            hostingController.view.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0),
            hostingController.view.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -ItemViewInset.rightDistanceToView),
        
        ]
        NSLayoutConstraint.activate(constraints)
    }
}
