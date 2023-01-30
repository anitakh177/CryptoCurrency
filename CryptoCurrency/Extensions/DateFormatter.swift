//
//  DateFormatter.swift
//  CryptoCurrency
//
//  Created by anita on 1/30/23.
//

import Foundation

extension String {
    func convertDate() -> String {
        let dateFormatter = ISO8601DateFormatter()
        let newDate = DateFormatter()
        let date = dateFormatter.date(from: self)!
        newDate.dateFormat = "dd.MM.yy"
        return newDate.string(from: date)
    }
}
