//
//  LabelConstructor.swift
//  CryptoCurrency
//
//  Created by anita on 1/30/23.
//

import UIKit

struct LabelConstructor {
    
    func createLabel(font: UIFont, alignment: NSTextAlignment, text: String) -> UILabel {
        let label = UILabel()
        label.font = font
        label.textAlignment = alignment
        label.textColor = .white
        label.text = text
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
}
