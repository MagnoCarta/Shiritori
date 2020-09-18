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
    
    // nav bar add button.
    lazy var barButton: UIBarButtonItem = {
        let icon = UIImage(systemName: "plus.circle.fill")
        let iconSize = CGRect(origin: CGPoint.zero, size: CGSize(width: 32, height: 30))
        let iconButton = UIButton(frame: iconSize)
        iconButton.setBackgroundImage(icon, for: .normal)
        iconButton.tintColor = .lightGreen
        let barButton = UIBarButtonItem(customView: iconButton)
        iconButton.addTarget(self, action: #selector(addFriend), for: .touchUpInside)
        return barButton
    }()
    
// MARK: - VIEW CYCLE
    override func loadView() {
        super.loadView()
        self.view = friendsView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureNavBar()
    }
// MARK: - ACTIONS
    
    @objc func addFriend() {
        print("Add Friend")
    }
// MARK: - FUNC
    private func configureNavBar() {
        navigationItem.title = "Lista de Amigos"
        // Always use Light Mode.
        navigationController?.overrideUserInterfaceStyle = .light
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.standardAppearance.configureWithTransparentBackground()
        navigationController?.navigationBar.topItem?.rightBarButtonItem = barButton
    }
}
