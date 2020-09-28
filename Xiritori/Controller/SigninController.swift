//
//  SigninController.swift
//  Xiritori
//
//  Created by Elias Ferreira on 16/09/20.
//  Copyright © 2020 Academy IFCE. All rights reserved.
//

import UIKit

class SigninController: UIViewController {
// MARK: - VIEW
    
    // View Cotent
    lazy var signinView: SigninView = {
        let view = SigninView()
        view.signinAction = { self.signin() }
        return view
    }()

// MARK: - APP CYCLE
    override func loadView() {
        super.loadView()
        self.view = signinView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureNavBar()
    }
// MARK: - ACTIONS
    
    func signin() { // signin action
        let repositoy = UserRepository()
        let username = String(self.signinView.usernameTextField.text!)
        let email = String(self.signinView.emailTextField.text!)
        let password = String(self.signinView.passwordTextField.text!)
        let repeatPassword = String(self.signinView.repeatPasswordTextField.text!)
        
        if password == repeatPassword {
            
            let user = User(username: username, email: email, password: password)
            
            if let userR = repositoy.create(userToSave: user) {
                print(userR.id)
            } else {
                print("Erro ao criar usuário!")
            }
            
        } else {
            print("Password should be same.")
        }
    }
    
// MARK: - FUNCS
    
    private func configureNavBar() {
        let backItem = UIBarButtonItem(title: "Login", style: .plain, target: nil, action: nil)
        backItem.tintColor = .backgroundColor
        navigationItem.title = "Cadastrar"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.topItem?.backBarButtonItem = backItem
        navigationController?.navigationBar.largeTitleTextAttributes = [
            NSAttributedString.Key.font: UIFont(name: "MyMessyHandwriting", size: 40)!,
            NSAttributedString.Key.foregroundColor: UIColor.white
        ]
    }
}
