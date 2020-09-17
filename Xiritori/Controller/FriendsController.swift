//
//  FriendsController.swift
//  Xiritori
//
//  Created by Elias Ferreira on 17/09/20.
//  Copyright © 2020 Academy IFCE. All rights reserved.
//

import UIKit

class FriendsController: UIViewController {
// MARK: - VIEW
    let friendsView = FriendsView()
    
    override func loadView() {
        super.loadView()
        self.view = friendsView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
