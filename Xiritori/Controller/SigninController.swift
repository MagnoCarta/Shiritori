//
//  SigninController.swift
//  Xiritori
//
//  Created by Elias Ferreira on 16/09/20.
//  Copyright © 2020 Academy IFCE. All rights reserved.
//

import UIKit

class SigninController: UIViewController {
    
    let signinView = SigninView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Cadastrar"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.view = signinView
        
    }
}
