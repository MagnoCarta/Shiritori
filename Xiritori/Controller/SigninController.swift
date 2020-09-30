//
//  SigninController.swift
//  Xiritori
//
//  Created by Elias Ferreira on 16/09/20.
//  Copyright © 2020 Academy IFCE. All rights reserved.
//

import UIKit

class SigninController: UIViewController {
    
    let repositoy = UserRepository()
    var session: Session? {
        didSet {
            print(self.session!.token)
        }
    }
    
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
        let user = User(
            username: String(self.signinView.usernameTextField.text!),
            email: String(self.signinView.emailTextField.text!),
            password: String(self.signinView.passwordTextField.text!)
        )
        
        if validadeNoNullFields(user.username, user.email) {
            if validatePassword(user.password, self.signinView.repeatPasswordTextField.text!) {
                
                self.repositoy.create(userToSave: user) { (session) in
                    if let session = session {
                        self.session = session
                    } else {
                        print("Nao foi possível criar o usuário!")
                    }
                }
                
            } else {
                print("Password should be same!")
            }
        } else {
            print("All fields are required!")
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
    
    private func validadeNoNullFields(_ fieldsContents: String...) -> Bool {
        for content in fieldsContents where content == "" {
            return false
        }
        return true
    }
    
    private func validatePassword(_ pass1: String, _ pass2: String) -> Bool {
        if pass1 == pass2 && pass1 != "" {
            return true
        } else {
            return false
        }
    }
}
