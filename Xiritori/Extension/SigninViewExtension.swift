//
//  SigninViewExtension.swift
//  Xiritori
//
//  Created by Elias Ferreira on 16/09/20.
//  Copyright © 2020 Academy IFCE. All rights reserved.
//

import UIKit

extension SigninView {
    
    func setupTextFields() {
        // Username TextField Constraints
        usernameTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            usernameTextField.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 20),
            usernameTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40),
            usernameTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40),
            usernameTextField.heightAnchor.constraint(equalToConstant: 45)
        ])
        // Email TextField Constraints
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            emailTextField.topAnchor.constraint(equalTo: usernameTextField.bottomAnchor, constant: 10),
            emailTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40),
            emailTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40),
            emailTextField.heightAnchor.constraint(equalToConstant: 45)
        ])
        // Password TextField Constraints
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 10),
            passwordTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40),
            passwordTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40),
            passwordTextField.heightAnchor.constraint(equalToConstant: 45)
        ])
        // RepeatPassword TextField Constraints
        repeatPasswordTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            repeatPasswordTextField.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 10),
            repeatPasswordTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40),
            repeatPasswordTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40),
            repeatPasswordTextField.heightAnchor.constraint(equalToConstant: 45)
        ])
    }
    
    func setupButtons() {
        // Signin TextField Constraints
        signinButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            signinButton.topAnchor.constraint(equalTo: repeatPasswordTextField.bottomAnchor, constant: 20),
            signinButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40),
            signinButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40),
            signinButton.heightAnchor.constraint(equalToConstant: 45)
        ])
    }
}
