//
//  ViewController.swift
//  Xiritori
//
//  Created by Elias Ferreira on 13/09/20.
//  Copyright © 2020 Academy IFCE. All rights reserved.
//

import UIKit

class LoginController: UIViewController {
// MARK: - VIEW
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
        print("Logar!")
    }
    
    private func guest() { // log as a guest.
        print("Convidado!")
    }
    
    private func signin() { // goes to signin screen.
        let signinController = SigninController()
        navigationController?.pushViewController(signinController, animated: true)
    }
}
