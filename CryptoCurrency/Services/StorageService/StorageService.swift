//
//  StorageService.swift
//  CryptoCurrency
//
//  Created by anita on 1/30/23.
//

import Foundation

final class StorageService {
    let userDefaults = UserDefaults.standard
    
    private let timeKey: String = "TimeKey"
    static let shared = StorageService()
      
        private init() { }

    
   func saveLastTime() {
        let lastSavedTime = Date().timeIntervalSince1970
        userDefaults.setValue(lastSavedTime, forKey: timeKey)
    }
    
    func getLastSavedTime() -> Double {
        return userDefaults.object(forKey: timeKey) as? Double ?? 0
    }
}
