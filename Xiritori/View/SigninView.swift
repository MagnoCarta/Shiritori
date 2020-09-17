//
//  SigninView.swift
//  Xiritori
//
//  Created by Elias Ferreira on 16/09/20.
//  Copyright © 2020 Academy IFCE. All rights reserved.
//

import UIKit

class SigninView: UIView {
    // Username TextField.
    lazy var usernameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Username"
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
        button.setTitleColor(.blue, for: .normal)
        button.layer.borderWidth = 1.0
        button.layer.borderColor = UIColor.gray.cgColor
        button.addTarget(self, action: #selector(signin), for: .touchUpInside)
        return button
    }()
// MARK: - ACTIONS
    // SignIn Button Action
    var signinAction: (() -> Void)!
    @objc func signin(sender: UIButton!) { print("Cad Teste!") }

// MARK: - INIT
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.addSubviews()
        self.setupAllViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
// MARK: - FUNC
    private func addSubviews() {
        self.addSubview(usernameTextField)
        self.addSubview(emailTextField)
        self.addSubview(passwordTextField)
        self.addSubview(repeatPasswordTextField)
        self.addSubview(signinButton)
    }
    
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
