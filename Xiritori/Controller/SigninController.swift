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
        repositoy.create(username: "EliasNexo", email: "eliasnexo@gmail.com", password: "123")
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
