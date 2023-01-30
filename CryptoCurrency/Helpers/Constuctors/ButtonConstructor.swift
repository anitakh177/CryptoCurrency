//
//  ButtonConstructor.swift
//  CryptoCurrency
//
//  Created by anita on 1/30/23.
//
import UIKit

struct ButtonConstructor {
    
    func createButton(text: String) -> UIButton {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width - ItemViewInset.leftDistanceToView - ItemViewInset.rightDistanceToView , height: 52))
       
        var gradient = Gradient()
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
        gradient.pinkGradient.frame = button.bounds
        button.layer.addSublayer(gradient.pinkGradient)
        
        let customButtonTitle = NSMutableAttributedString(string: text, attributes: [
            NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 20),
            NSAttributedString.Key.foregroundColor: UIColor.white
        ])
        
        button.setAttributedTitle(customButtonTitle, for: .normal)
        button.heightAnchor.constraint(equalToConstant: 52).isActive = true
    
        return button
    }
}
