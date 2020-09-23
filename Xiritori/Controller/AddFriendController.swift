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
    
// MARK: - VIEW CYCLE

    override func loadView() {
        super.loadView()
        self.view = addFriendView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Register the cell on tableview.
        self.addFriendView.tableView.register(FriendsTableViewCell.self, forCellReuseIdentifier: "AddFriendCell")
        // Add tap gesture.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        addFriendView.addGestureRecognizer(tap)
    }

// MARK: - FUNCS
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }

// MARK: - ACTIONS
    
    func plusAction() {
        print("+")
    }
}

// MARK: - TableView Delegate and DataSource

extension AddFriendController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "AddFriendCell",
            for: indexPath
        ) as? FriendsTableViewCell
        cell?.setupCellForAddFriend()
        cell?.buttonVsPlusAction = self.plusAction
        return cell!
    }
}
