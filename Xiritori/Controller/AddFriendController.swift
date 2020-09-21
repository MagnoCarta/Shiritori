//
//  AddFriendController.swift
//  Xiritori
//
//  Created by Elias Ferreira on 21/09/20.
//  Copyright © 2020 Academy IFCE. All rights reserved.
//

import UIKit

class AddFriendController: UIViewController {
// MARK: - VIEW
    lazy var addFriendView: AddFriend = {
        let addFriend = AddFriend()
        addFriend.tableView.delegate = self
        addFriend.tableView.dataSource = self
        return addFriend
    }()

    override func loadView() {
        super.loadView()
        self.view = addFriendView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.addFriendView.tableView.register(FriendsTableViewCell.self, forCellReuseIdentifier: "AddFriendCell")
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        addFriendView.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

// MARK: - UITableView Delegate and DataSource

extension AddFriendController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "AddFriendCell",
            for: indexPath
        ) as? FriendsTableViewCell
        
        cell?.setupWhithoutButton()
//        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        
//        cell.selectionStyle = .none
//        cell.backgroundColor = .clear
//        cell.textLabel?.text = "Title \(indexPath.row)"
//        cell.detailTextLabel?.text = "Body \(indexPath.row)"
        
        return cell!
    }
}
