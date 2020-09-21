//
//  FriendsView.swift
//  Xiritori
//
//  Created by Elias Ferreira on 17/09/20.
//  Copyright © 2020 Academy IFCE. All rights reserved.
//

import UIKit

class FriendsView: UIView {
    // SearchBar
    lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.searchBarStyle = .minimal
        searchBar.searchTextField.backgroundColor = .white
        searchBar.searchTextField.returnKeyType = .search
        searchBar.searchTextField.layer.cornerRadius = 18
        searchBar.searchTextField.clipsToBounds = true
        return searchBar
    }()
    
    // TableView
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.backgroundColor = .clear
        tableView.alwaysBounceVertical = true
        tableView.tableHeaderView = .none
        tableView.alwaysBounceHorizontal = false
        tableView.separatorInset = .zero
        tableView.tableFooterView = UIView()
        tableView.layer.borderWidth = 0.3
        tableView.layer.borderColor = UIColor.gray.cgColor
        tableView.rowHeight = 95
        return tableView
    }()
    
// MARK: - INIT
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.addSubview(searchBar)
        self.addSubview(tableView)
        self.septupSearchBar()
        self.setupTableView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
