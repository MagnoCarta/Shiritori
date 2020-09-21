//
//  AddFriend.swift
//  Xiritori
//
//  Created by Elias Ferreira on 21/09/20.
//  Copyright © 2020 Academy IFCE. All rights reserved.
//

import UIKit

class AddFriend: UIView {
    // SearchBar
    let searchBar = FriendsSearchBar()
       
    // TableView
    let tableView = FriendsTableView(frame: .zero, style: .plain)

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.addSubview(searchBar)
        self.addSubview(tableView)
        self.septupSearchBar()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Constraints
    func septupSearchBar() {
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 40),
            searchBar.heightAnchor.constraint(equalToConstant: 50),
            searchBar.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
            searchBar.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8)
        ])
    
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 10),
            tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    }
}
