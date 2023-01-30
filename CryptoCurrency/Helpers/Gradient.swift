//
//  Gradient.swift
//  CryptoCurrency
//
//  Created by anita on 1/30/23.
//

import UIKit

struct Gradient {
    
   lazy var purpleGradinet: CAGradientLayer = {
        let gradient = CAGradientLayer()
       gradient.type = .axial
       gradient.colors = [Colors.backgroundColor.cgColor,  Colors.darkPurpleColor.cgColor]
       gradient.locations = [0.5, 1]
        return gradient
    }()
    
    lazy var pinkGradient: CAGradientLayer = {
        let gradient = CAGradientLayer()
        gradient.colors = [Colors.darkPurpleColor.cgColor, Colors.purpleColor.cgColor]
        gradient.startPoint = CGPoint(x: 1.0, y: 0.0)
        gradient.endPoint = CGPoint(x: 0, y: 1.0)
        
        return gradient
    }()
}
