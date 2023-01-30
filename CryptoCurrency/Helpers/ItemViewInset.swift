//
//  ItemViewInset.swift
//  CryptoCurrency
//
//  Created by anita on 1/30/23.
//

import UIKit

struct ItemViewInset {
    static let leftDistanceToView: CGFloat = 16
    static let rightDistanceToView: CGFloat = 16
    static let minimumLineSpacing: CGFloat = 16
    static let itemWidth = (UIScreen.main.bounds.width - ItemViewInset.leftDistanceToView - ItemViewInset.rightDistanceToView - (ItemViewInset.minimumLineSpacing / 2)) / 1
    static let itemHeight: CGFloat = 90
}

