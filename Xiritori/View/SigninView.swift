//
//  SigninView.swift
//  Xiritori
//
//  Created by Elias Ferreira on 16/09/20.
//  Copyright © 2020 Academy IFCE. All rights reserved.
//

import UIKit

class SigninView: UIView {
    
// MARK: - VIEWS
    
    // Username TextField.
    lazy var usernameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Username"
        textField.font = UIFont(name: "Comfortaa", size: 17)
        textField.layer.borderWidth = 1.0
        textField.layer.borderColor = UIColor.gray.cgColor
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        textField.clipsToBounds = true
        return textField
    }()
    
    // Email TextField.
    lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Email"
        textField.font = UIFont(name: "Comfortaa", size: 17)
        textField.layer.borderWidth = 1.0
        textField.layer.borderColor = UIColor.gray.cgColor
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        textField.keyboardType = .emailAddress
        textField.clipsToBounds = true
        return textField
    }()
    
    // Password TextField.
    lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Senha"
        textField.font = UIFont(name: "Comfortaa", size: 17)
        textField.layer.borderWidth = 1.0
        textField.layer.borderColor = UIColor.gray.cgColor
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        textField.isSecureTextEntry = true
        textField.clipsToBounds = true
        return textField
    }()
    
    // Repeat Password TextField.
    lazy var repeatPasswordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Confirmar Senha"
        textField.font = UIFont(name: "Comfortaa", size: 17)
        textField.layer.borderWidth = 1.0
        textField.layer.borderColor = UIColor.gray.cgColor
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        textField.isSecureTextEntry = true
        textField.clipsToBounds = true
        return textField
    }()
    
    // Submit Button.
    lazy var signinButton: UIButton = {
        let button = UIButton()
        button.setTitle("Cadastrar", for: .normal)
        button.titleLabel?.font = UIFont(name: "MyMessyHandwriting", size: 30)
        button.setTitleColor(.blazingBlack, for: .normal)
        button.backgroundColor = .lightGreen
        button.layer.borderWidth = 1.0
        button.layer.borderColor = UIColor.gray.cgColor
        button.addTarget(self, action: #selector(signin), for: .touchUpInside)
        return button
    }()
    
// MARK: - ACTIONS
    
    // SignIn Button Action
    var signinAction: (() -> Void)!
    @objc func signin(sender: UIButton!) {
        signinAction()
    }

// MARK: - INIT
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .seriousPurple
        self.addSubviews(
            usernameTextField,
            emailTextField,
            passwordTextField,
            repeatPasswordTextField,
            signinButton
        )
        self.setupTextFields()
        self.setupButtons()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
// MARK: - FUNCS
    
    override func layoutSubviews() {
        super.layoutSubviews()
        usernameTextField.layer.cornerRadius = usernameTextField.frame.height / 2
        emailTextField.layer.cornerRadius = emailTextField.frame.height / 2
        passwordTextField.layer.cornerRadius = passwordTextField.frame.height / 2
        repeatPasswordTextField.layer.cornerRadius = repeatPasswordTextField.frame.height / 2
        signinButton.layer.cornerRadius = signinButton.frame.height / 2
    }
    
    // Dismiss the keyboard when the view is touched.
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.endEditing(true)
    }
    
}
