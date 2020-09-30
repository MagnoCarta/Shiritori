//
//  SettingsViewController.swift
//  Xiritori
//
//  Created by Gilberto Magno on 9/24/20.
//  Copyright © 2020 Academy IFCE. All rights reserved.
//

import Foundation
import UIKit

class SettingsViewController: UIViewController {
    
    let editButton: UIBarButtonItem = {
       let button = UIBarButtonItem()
        
        button.title = "Editar"

        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = SettingsView()
        editButton.action = #selector(edit)
        editButton.target = self
        self.navigationItem.rightBarButtonItem = editButton
        }
    
    @objc func edit() {
    }
    
}
