//
//  NumberFormatter.swift
//  CryptoCurrency
//
//  Created by anita on 1/30/23.
//

import Foundation

extension Double {
    func convertNumber() -> String {
        let numFormatter = NumberFormatter()
        typealias Abbrevation = (threshold:Double, divisor:Double, suffix:String)
        let abbreviations:[Abbrevation] = [(0, 1, ""),
                                           (1000.0, 1000.0, "K"),
                                           (100_000.0, 1_000_000.0, "M"),
                                           (100_000_000.0, 1_000_000_000.0, "B")]
        
        let startValue = Double (abs(self))
        let abbreviation:Abbrevation = {
            var prevAbbreviation = abbreviations[0]
            for tmpAbbreviation in abbreviations {
                if (startValue < tmpAbbreviation.threshold) {
                    break
                }
                prevAbbreviation = tmpAbbreviation
            }
            return prevAbbreviation
        } ()
        
        let value = Double(self) / abbreviation.divisor
        numFormatter.positiveSuffix = abbreviation.suffix
        numFormatter.negativeSuffix = abbreviation.suffix
        numFormatter.allowsFloats = true
        numFormatter.minimumIntegerDigits = 1
        numFormatter.minimumFractionDigits = 0
        numFormatter.maximumFractionDigits = 1
        
        guard let formattedNumber = numFormatter.string(from: NSNumber (value:value)) else { return "No Info"}
        
            return formattedNumber + "$"
        }
    
        
        func convertPercent() -> String {
            let numFormatter = NumberFormatter()
            numFormatter.numberStyle = .decimal
            numFormatter.decimalSeparator = "."
            numFormatter.maximumFractionDigits = 2
            return numFormatter.string(from: NSNumber(value: self))!
        }
    }

