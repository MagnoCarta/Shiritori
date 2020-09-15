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
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        view.addSubview(loginView)
        
        self.setupLayout()
        
        loginView.submitAction = {
            print("Clicou!")
        }
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            loginView.topAnchor.constraint(equalTo: view.topAnchor),
            loginView.leftAnchor.constraint(equalTo: view.leftAnchor),
            loginView.rightAnchor.constraint(equalTo: view.rightAnchor),
            loginView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
