//
//  FriendsSearchBar.swift
//  Xiritori
//
//  Created by Elias Ferreira on 21/09/20.
//  Copyright © 2020 Academy IFCE. All rights reserved.
//

import UIKit

extension UISearchBar {

    func setUpSearchBar() {
        self.searchBarStyle = .minimal
        self.searchTextField.backgroundColor = .white
        self.searchTextField.returnKeyType = .search
        self.searchTextField.layer.cornerRadius = 18
        self.searchTextField.placeholder = "Procurar"
        self.searchTextField.clipsToBounds = true
        self.searchTextField.font = UIFont(name: "Comfortaa", size: 17)
        self.tintColor = .seriousPurple
        self.keyboardAppearance = .light
    }
}
