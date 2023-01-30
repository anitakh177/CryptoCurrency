//
//  AuthService.swift
//  CryptoCurrency
//
//  Created by anita on 1/30/23.
//

import UIKit

final class AuthService {
    
   static func authentification(window: UIWindow?) {
        let status = UserDefaults.standard.value(forKey: "login")
            
        if (status == nil) {
                let loginVC = LoginModuleConfigurator().configureLoginModule()
                let navCon = UINavigationController(rootViewController: loginVC)
                window?.rootViewController = navCon
                
            } else {
                let mainVc = MainModuleConfigurator().configureMainModule()
                let navCon = UINavigationController(rootViewController: mainVc)
                window?.rootViewController = navCon
            }
        
        
    }
    
}
