//
//  LoginViewExtension.swift
//  Xiritori
//
//  Created by Elias Ferreira on 16/09/20.
//  Copyright © 2020 Academy IFCE. All rights reserved.
//

import UIKit

extension LoginView {
    
    func setupLogin() {
        // Logo Constraints
        logo.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            logo.topAnchor.constraint(equalTo: self.topAnchor, constant: 90),
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
            emailTextField.heightAnchor.constraint(equalToConstant: 45)
        ])
        // Password TextField Contraints
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 10),
            passwordTextField.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 40),
            passwordTextField.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -40),
            passwordTextField.heightAnchor.constraint(equalToConstant: 45)
        ])
        // Submit Button Contraints
        submitButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            submitButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 10),
            submitButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 40),
            submitButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -40),
            submitButton.heightAnchor.constraint(equalToConstant: 45)
        ])
    }
    
    func setupSeparator() {
        // Separator
        separator.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            separator.topAnchor.constraint(equalTo: submitButton.bottomAnchor, constant: 30),
            separator.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 40),
            separator.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -40)
        ])
    }
    
    func setupOptionButtons() {
        // Apple Authorization Button
        autoriztionAppleButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            autoriztionAppleButton.topAnchor.constraint(equalTo: separator.bottomAnchor, constant: 45),
            autoriztionAppleButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 40),
            autoriztionAppleButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -40),
            autoriztionAppleButton.heightAnchor.constraint(equalToConstant: 45)
        ])
        // SignIn Button Contraints
        signinButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            signinButton.topAnchor.constraint(equalTo: autoriztionAppleButton.bottomAnchor, constant: 10),
            signinButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 40),
            signinButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -40),
            signinButton.heightAnchor.constraint(equalToConstant: 45)
        ])
        // Guest Button Contraints
        guestButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            guestButton.topAnchor.constraint(equalTo: signinButton.bottomAnchor, constant: 10),
            guestButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 40),
            guestButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -40),
            guestButton.heightAnchor.constraint(equalToConstant: 45)
        ])
    }
}
