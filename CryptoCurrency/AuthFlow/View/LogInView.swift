//
//  LogInView.swift
//  CryptoCurrency
//
//  Created by anita on 1/30/23.
//

import UIKit

class LogInView: UIView {
    
    // MARK: - Events
    
    var didLoginTapped: (() -> Void)?
    
    // MARK: - Views
    
    private let loginLabel = LabelConstructor().createLabel(font: .systemFont(ofSize: 24, weight: .semibold), alignment: .center, text: "Log In")
    private let errorLabel = LabelConstructor().createLabel(font: .systemFont(ofSize: 16, weight: .semibold), alignment: .center, text: "")
    
    let emailField = TextFieldConstructor().createTextField(text: "User Name")
    let passwordField = TextFieldConstructor().createTextField(text: "Password")
    
    private let loginButton = ButtonConstructor().createButton(text: "Log In")
    
    
    
    private lazy var stack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [loginLabel, emailField, passwordField, loginButton, errorLabel])
        stack.axis = .vertical
        stack.spacing = 20
        stack.distribution = .fillProportionally
        
        return stack
    }()
    
    
    @objc func didTapButton() {
        UIView.animate(withDuration: 0.2,
            animations: {
            self.loginButton.transform = CGAffineTransform(scaleX: 0.98, y: 0.98)
            },
            completion: { _ in
                UIView.animate(withDuration: 0.2) {
                    self.loginButton.transform = CGAffineTransform.identity
                }
            })
        didLoginTapped?()
    }
    // MARK: - Initilization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
      configureViews()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Layout
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupStackView()
    }
    
    // MARK: - Open Methods
    
    func showErrorMessage(_ message: String) {
        errorLabel.text = message
        errorLabel.alpha = 1
    }
    
    
}
// MARK: - Private Methods

private extension LogInView {
    
    func configureViews() {
        errorLabel.textColor = .red
        errorLabel.alpha = 0
        passwordField.isSecureTextEntry = true
        loginButton.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        
    }
    
    func setupStackView() {
     addSubview(stack)
     stack.translatesAutoresizingMaskIntoConstraints = false
     
     NSLayoutConstraint.activate([
       stack.centerXAnchor.constraint(equalTo: centerXAnchor),
       stack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: ItemViewInset.leftDistanceToView),
       stack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -ItemViewInset.rightDistanceToView),
       stack.topAnchor.constraint(equalTo: topAnchor),
       stack.heightAnchor.constraint(equalTo: heightAnchor)
     ])
       
      
}
   
}

