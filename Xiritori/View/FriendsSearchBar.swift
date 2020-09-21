//
//  FriendsSearchBar.swift
//  Xiritori
//
//  Created by Elias Ferreira on 21/09/20.
//  Copyright © 2020 Academy IFCE. All rights reserved.
//

import UIKit

class FriendsSearchBar: UISearchBar {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.searchBarStyle = .minimal
        self.searchTextField.backgroundColor = .white
        self.searchTextField.returnKeyType = .search
        self.searchTextField.layer.cornerRadius = 18
        self.searchTextField.clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
