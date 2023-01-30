//
//  LoginViewOutput.swift
//  CryptoCurrency
//
//  Created by anita on 1/30/23.
//

import Foundation

protocol LoginViewOutput: AnyObject {
    func showMainModule()
    func validateFields(email: String, password: String) -> String?
    
}
