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
    
        let email = loginView.emailTextField.text!
        let pass = loginView.passwordTextField.text!
        
        // TESTE
        self.repository.login(email: email, password: pass) { (session) in
            if session != nil {
                DispatchQueue.main.async {
                    let mainScreenController = MainScreenController()
     //               mainScreenController.session = session
                    mainScreenController.modalPresentationStyle = .fullScreen
                    self.navigationController?.pushViewController(mainScreenController, animated: true)
                }
            } else {
                print("Login ou senha incorreto!")
            }
        }
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
}
