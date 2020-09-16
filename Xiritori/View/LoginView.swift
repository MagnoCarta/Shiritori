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
    // Logo Image.
    lazy var logo: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "test"))
        return imageView
    }()
    
    // Email TextField.
    lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Email/Username"
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
        button.setTitle("Login", for: .normal)
        button.setTitleColor(.blue, for: .normal)
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
    
    // Submit Button.
    lazy var signinButton: UIButton = {
        let button = UIButton()
        button.setTitle("Cadastrar", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.layer.borderWidth = 1.0
        button.layer.borderColor = UIColor.gray.cgColor
        button.addTarget(self, action: #selector(submit), for: .touchUpInside)
        return button
    }()
    
    // Submit Button.
    lazy var guestButton: UIButton = {
        let button = UIButton()
        button.setTitle("Convidado", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.layer.borderWidth = 1.0
        button.layer.borderColor = UIColor.gray.cgColor
        button.addTarget(self, action: #selector(submit), for: .touchUpInside)
        return button
    }()
    
    // Submit Button Action
    var submitAction: (() -> Void)!
    @objc func submit(sender: UIButton!) {
        submitAction()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubviews()
        self.setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
    
    private func addSubviews() {
        self.addSubview(logo)
        self.addSubview(emailTextField)
        self.addSubview(passwordTextField)
        self.addSubview(submitButton)
        self.addSubview(separator)
        self.addSubview(autoriztionAppleButton)
        self.addSubview(signinButton)
        self.addSubview(guestButton)
    }
    
// MARK: - CONSTRAINTS
    
    private func setupLayout() {
        // Logo Constraints
        logo.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            logo.topAnchor.constraint(equalTo: self.topAnchor, constant: 100),
            logo.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            logo.widthAnchor.constraint(equalToConstant: 126),
            logo.heightAnchor.constraint(equalTo: logo.widthAnchor)
        ])
        // Email TextField Constraints
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            emailTextField.topAnchor.constraint(equalTo: logo.bottomAnchor, constant: 40),
            emailTextField.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 40),
            emailTextField.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -40),
            emailTextField.heightAnchor.constraint(equalToConstant: 50)
        ])
        // Password TextField Contraints
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 10),
            passwordTextField.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 40),
            passwordTextField.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -40),
            passwordTextField.heightAnchor.constraint(equalToConstant: 50)
        ])
        // Submit Button Contraints
        submitButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            submitButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 10),
            submitButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 40),
            submitButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -40),
            submitButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        // Separator
        separator.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            separator.topAnchor.constraint(equalTo: submitButton.bottomAnchor, constant: 40),
            separator.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 40),
            separator.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -40)
        ])
        // Apple Authorization Button
        autoriztionAppleButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            autoriztionAppleButton.topAnchor.constraint(equalTo: separator.bottomAnchor, constant: 55),
            autoriztionAppleButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 40),
            autoriztionAppleButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -40),
            autoriztionAppleButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        // SignIn Button Contraints
        signinButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            signinButton.topAnchor.constraint(equalTo: autoriztionAppleButton.bottomAnchor, constant: 10),
            signinButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 40),
            signinButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -40),
            signinButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        // Guest Button Contraints
        guestButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            guestButton.topAnchor.constraint(equalTo: signinButton.bottomAnchor, constant: 10),
            guestButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 40),
            guestButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -40),
            guestButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
