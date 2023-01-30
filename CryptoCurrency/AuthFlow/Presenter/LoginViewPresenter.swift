//
//  LoginViewPresenter.swift
//  CryptoCurrency
//
//  Created by anita on 1/30/23.
//

import Foundation

final class LoginViewPresenter: LoginViewOutput {
    
    
    // MARK: - Propertues
    
  weak  var view: LoginViewInput?
    
    // MARK: - Open Methods
    
    func showMainModule() {
        UserDefaults.standard.set(true, forKey: "login")
        view?.pushMainModule()
    }
    
     func validateFields(email: String, password: String) -> String? {
          
          // check if all field are filled in
          if email.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
              password.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
              
              return "Please fill in all fields."
          }
        else if email.trimmingCharacters(in: .whitespacesAndNewlines) != "1234" ||
                password.trimmingCharacters(in: .whitespacesAndNewlines) != "1234" {
            return "Invalid email or password"
        }
      
          return nil
      }
    
    
 
}
