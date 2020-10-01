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
    var session: Session?
    
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
                        DispatchQueue.main.async {
                            let mainScreenController = MainScreenController()
                            mainScreenController.session = session
                            mainScreenController.modalPresentationStyle = .fullScreen
                            self.navigationController?.pushViewController(mainScreenController, animated: true)
                        }
                    } else {
                        DispatchQueue.main.async {
                            self.showErrorMessage("Nao foi possível criar o usuário!")
                        }
                    }
                }
                
            } else {
                self.showErrorMessage("As Senhas não são iguais!")
            }
        } else {
            self.showErrorMessage("Todos os campos são obrigatórios!")
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
    
    func showErrorMessage(_ message: String) {
        let dialogMessage = UIAlertController(title: "Erro!", message: message, preferredStyle: .alert)
        // Create OK button with action handler
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        //Add Cancel button to an Alert object
        dialogMessage.addAction(cancel)
        // Present alert message to user
        self.present(dialogMessage, animated: true, completion: nil)
        //dialogMessage.setMessage(font: UIFont(name: "Comfortaa", size: 18), color: .black)
        dialogMessage.setTitle(font: UIFont(name: "Comfortaa-Bold", size: 20), color: .lightRed)
    }
}
