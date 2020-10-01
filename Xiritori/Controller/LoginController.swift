//
//  ViewController.swift
//  Xiritori
//
//  Created by Elias Ferreira on 13/09/20.
//  Copyright © 2020 Academy IFCE. All rights reserved.
//

import UIKit

class LoginController: UIViewController {
    let repository = UserRepository()
    
// MARK: - VIEW
    
    // View Content
    lazy var loginView: LoginView = {
        let view = LoginView()
        view.submitAction = { self.login() }
        view.signinAction = { self.signin() }
        view.guestAction = { self.guest() }
        return view
    }()
    
// MARK: - APP CYCLE
    
    override func loadView() {
        super.loadView()
        self.view = loginView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.overrideUserInterfaceStyle = .light
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
    }
    
// MARK: - ACTIONS
    
    func login() { // login action.
        
        // - To the TESTS.
        
        let mainScreenController = MainScreenController()
        mainScreenController.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(mainScreenController, animated: true)
        
        // - To the DEPLOY.
        
//        let email = loginView.emailTextField.text!
//        let pass = loginView.passwordTextField.text!
//
//        self.repository.login(email: email, password: pass) { [self] (session) in
//            if session != nil {
//                DispatchQueue.main.async {
//                    let mainScreenController = MainScreenController()
//                    //mainScreenController.session = session
//                    mainScreenController.modalPresentationStyle = .fullScreen
//                    self.navigationController?.pushViewController(mainScreenController, animated: true)
//                }
//            } else {
//                DispatchQueue.main.async {
//                    self.showErrorMessage(message: "Usuário ou Senha incorretos!")
//                }
//            }
//        }
        
    }
    
    private func guest() { // log as a guest.
        print("Convidado!")
		let mainScreenController = MainScreenController()
		mainScreenController.modalPresentationStyle = .fullScreen
		self.navigationController?.pushViewController(mainScreenController, animated: true)
    }
    
    private func signin() { // goes to signin screen.
        let signinController = SigninController()
        navigationController?.pushViewController(signinController, animated: true)
    }

// MARK: - FUNCS
    
    func showErrorMessage(message: String) {
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
