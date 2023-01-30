//
//  LoginViewController.swift
//  CryptoCurrency
//
//  Created by anita on 1/30/23.
//

import UIKit

final class LoginViewController: UIViewController {
    
    // MARK: - Properties
    
    var presenter: LoginViewOutput!
    
    // MARK: - Views
    
    private let logInView = LogInView()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureApperance()
        logInView.didLoginTapped = { [weak self] in
            self?.showMainModule()
        }
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        logInView.emailField.becomeFirstResponder()
    }
    
}

// MARK: - LoginViewInput

extension LoginViewController: LoginViewInput, ModuleTransitionable {
    func pushMainModule() {
        let error = presenter.validateFields(email: logInView.emailField.text ?? "", password: logInView.passwordField.text ?? "")
        
        if error == nil && logInView.passwordField.text == "1234" && logInView.emailField.text == "1234" {
            let mainVC = MainModuleConfigurator().configureMainModule()
            changeRootView(module: mainVC)
        } else {
            logInView.showErrorMessage(error ?? "")
        }
       
    }
}

// MARK: - Private Methods

private extension LoginViewController {

    @objc func showMainModule() {
        presenter.showMainModule()
    }
    
    func configureApperance() {
        view.backgroundColor = Colors.backgroundColor
        setupLogInViewConstraints()
    }
    
    func setupLogInViewConstraints() {
        view.addSubview(logInView)
        logInView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            logInView.widthAnchor.constraint(equalTo: view.widthAnchor),
            logInView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            logInView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            logInView.topAnchor.constraint(equalTo: view.topAnchor, constant: 130),
            logInView.heightAnchor.constraint(equalToConstant: 300)
        ])
    }
}

