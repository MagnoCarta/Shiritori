//
//  ViewController.swift
//  Xiritori
//
//  Created by Elias Ferreira on 13/09/20.
//  Copyright © 2020 Academy IFCE. All rights reserved.
//

import UIKit

class LoginController: UIViewController {
    let loginView: LoginView = {
        let view = LoginView()
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        self.setupLayout()
    }
    
    private func login() {
        print("Logar!")
    }
    
    private func guest() {
        print("Convidado!")
    }
    
    private func signin() {
        print("Cadastrar!")
    }
    
    private func setupLayout() {
        view.addSubview(loginView)
        loginView.translatesAutoresizingMaskIntoConstraints = false
        loginView.submitAction = { self.login() }
        loginView.signinAction = { self.signin() }
        loginView.guestAction = { self.guest() }
        
        NSLayoutConstraint.activate([
            loginView.topAnchor.constraint(equalTo: view.topAnchor),
            loginView.leftAnchor.constraint(equalTo: view.leftAnchor),
            loginView.rightAnchor.constraint(equalTo: view.rightAnchor),
            loginView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
