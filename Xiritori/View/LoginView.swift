//
//  LoginView.swift
//  Xiritori
//
//  Created by Elias Ferreira on 15/09/20.
//  Copyright © 2020 Academy IFCE. All rights reserved.
//

import UIKit
import AuthenticationServices

class LoginView: UIView {

// MARK: - VIEWS
    
    // Logo Image.
    lazy var logo: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "bart"))
        return imageView
    }()
    
    // Email TextField.
    lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Email ou Apelido"
        textField.font = UIFont(name: "Comfortaa", size: 17)
        textField.textColor = .blazingBlack
        textField.layer.borderWidth = 1.0
        textField.layer.borderColor = UIColor.gray.cgColor
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        textField.keyboardType = .emailAddress
        textField.textContentType = .emailAddress
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
        textField.textContentType = .password
        textField.isSecureTextEntry = true
        textField.clipsToBounds = true
        return textField
    }()
    
    // Submit Button.
    lazy var submitButton: UIButton = {
        let button = UIButton()
        button.setTitle("Entrar", for: .normal)
        button.titleLabel?.font = UIFont(name: "MyMessyHandwriting", size: 30)
        button.setTitleColor(.blazingBlack, for: .normal)
        button.backgroundColor = .lightGreen
        button.layer.borderWidth = 1.0
        button.layer.borderColor = UIColor.gray.cgColor
        button.addTarget(self, action: #selector(submit), for: .touchUpInside)
        return button
    }()
    
    // Separator OR
    lazy var separator: Separator = {
        let sep = Separator()
        return sep
    }()
    
    // Authorization Apple
    lazy var autoriztionAppleButton: ASAuthorizationAppleIDButton = {
        let authorizationButton = ASAuthorizationAppleIDButton()
        authorizationButton.clipsToBounds = true
        return authorizationButton
    }()
    
    // Signin Button.
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
    
    // Guest Button.
    lazy var guestButton: UIButton = {
        let button = UIButton()
        button.setTitle("Entrar como Convidado", for: .normal)
        button.titleLabel?.font = UIFont(name: "MyMessyHandwriting", size: 30)
        button.setTitleColor(.blazingBlack, for: .normal)
        button.backgroundColor = .lightRed
        button.layer.borderWidth = 1.0
        button.layer.borderColor = UIColor.gray.cgColor
        button.addTarget(self, action: #selector(guest), for: .touchUpInside)
        return button
    }()
    
// MARK: - ACTIONS
    
    // Submit Button Action
    var submitAction: (() -> Void)!
    @objc func submit(sender: UIButton!) { submitAction() }
    
    // SignIn Button Action
    var signinAction: (() -> Void)!
    @objc func signin(sender: UIButton!) { signinAction() }
    
    // SignIn Button Action
    var guestAction: (() -> Void)!
    @objc func guest(sender: UIButton!) { guestAction() }

// MARK: - INIT
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .seriousPurple
        self.addSubviews(
            logo,
            emailTextField,
            passwordTextField,
            submitButton,
            separator,
            autoriztionAppleButton,
            signinButton,
            guestButton
        )
        self.setupLogin()
        self.setupSeparator()
        self.setupOptionButtons()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

// MARK: - FUNCS
    
    override func layoutSubviews() {
        super.layoutSubviews()
        emailTextField.layer.cornerRadius = emailTextField.frame.height / 2
        passwordTextField.layer.cornerRadius = emailTextField.frame.height / 2
        submitButton.layer.cornerRadius = submitButton.frame.height / 2
        autoriztionAppleButton.layer.cornerRadius = autoriztionAppleButton.frame.height / 2
        signinButton.layer.cornerRadius = signinButton.frame.height / 2
        guestButton.layer.cornerRadius = guestButton.frame.height / 2
    }
    
    // Dismiss the keyboard when the view is touched.
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.endEditing(true)
    }
}
