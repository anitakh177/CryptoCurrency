//
//  TextFieldConstructor.swift
//  CryptoCurrency
//
//  Created by anita on 1/30/23.
//

import UIKit

struct TextFieldConstructor {
    
    func createTextField(text: String) -> UITextField {
        let textField = UITextField()
        textField.autocapitalizationType = .none
        textField.layer.cornerRadius = 10
        textField.leftViewMode = .always
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 0))
        textField.layer.borderWidth = 1
        textField.layer.borderColor = Colors.purpleColor.cgColor
        textField.textColor = .white
        textField.heightAnchor.constraint(equalToConstant: 52).isActive = true
        
        textField.attributedPlaceholder = NSAttributedString(
            string: text,
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white]
        )
        
        return textField
    }
    
    
}

