//
//  AddFriend.swift
//  Xiritori
//
//  Created by Elias Ferreira on 21/09/20.
//  Copyright © 2020 Academy IFCE. All rights reserved.
//

import UIKit

class AddFriend: UIView {
    // TableView
    let tableView = FriendsTableView(frame: .zero, style: .plain)
    
    // SearchBar
    let friendSearchBar = UISearchBar()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.addSubview(tableView)
        self.addSubview(friendSearchBar)
        friendSearchBar.setUpSearchBar()
        self.septupSearchBar()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Constraints
    func septupSearchBar() {
        friendSearchBar.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            friendSearchBar.topAnchor.constraint(equalTo: self.topAnchor, constant: 30),
            friendSearchBar.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10),
            friendSearchBar.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10)
        ])
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: friendSearchBar.bottomAnchor, constant: 10),
            tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    }
}
