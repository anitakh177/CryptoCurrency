//
//  LoginModuleConfigurator.swift
//  CryptoCurrency
//
//  Created by anita on 1/30/23.
//

import Foundation

final class LoginModuleConfigurator {
    
    func configureLoginModule() -> LoginViewController {
        let view = LoginViewController()
        let presenter = LoginViewPresenter()
                
        view.presenter = presenter
        presenter.view = view
        return view
    }
}
