//
//  FriendsController.swift
//  Xiritori
//
//  Created by Elias Ferreira on 17/09/20.
//  Copyright © 2020 Academy IFCE. All rights reserved.
//

import UIKit

class FriendsController: UIViewController {
// MARK: - VIEWS
    
    // View Content
    let friendsView = FriendsView()
    
    // nav bar add button.
    lazy var barButton: UIBarButtonItem = {
        let icon = UIImage(systemName: "plus.circle.fill")
        let iconSize = CGRect(origin: CGPoint.zero, size: CGSize(width: 37, height: 35))
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
        // TableView delegate and data source.
        friendsView.tableView.delegate = self
        friendsView.tableView.dataSource = self
        // Register the cell on tableview.
        self.friendsView.tableView.register(FriendsTableViewCell.self, forCellReuseIdentifier: "FriendCell")
        // Add tap gesture.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        friendsView.addGestureRecognizer(tap)
    }
    
// MARK: - ACTIONS
    
    @objc func addFriend() { // Plus button action.
        let addFriendController = AddFriendController()
        navigationController?.present(addFriendController, animated: true, completion: nil)
    }
    
    func vsAction() { // Action to button vs.
        print("VS")
    }
    
    func removeFriend() { // Action to remove a friend.
        print("Remove Friend!")
    }
    
// MARK: - FUNCS
    
    private func configureNavBar() {
        self.navigationItem.title = "Lista de Amigos"
        self.navigationController?.overrideUserInterfaceStyle = .light
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.rightBarButtonItem = barButton
        
        // SerchBar.
        let searchBarController = UISearchController()
        searchBarController.searchBar.setUpSearchBar()
        navigationItem.searchController = searchBarController
        navigationItem.hidesSearchBarWhenScrolling = false
        // Font.
        self.navigationController?.navigationBar.largeTitleTextAttributes = [
            NSAttributedString.Key.font: UIFont(name: "MyMessyHandwriting", size: 40)!,
            NSAttributedString.Key.foregroundColor: UIColor.white
        ]
        self.navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.font: UIFont(name: "MyMessyHandwriting", size: 20)!,
            NSAttributedString.Key.foregroundColor: UIColor.white
        ]
    }
    // Func to dismiss the keyboard.
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

// MARK: - TableView Delegate and DataSource

extension FriendsController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FriendCell", for: indexPath) as? FriendsTableViewCell
        cell?.buttonVsPlusAction = self.vsAction
        cell?.buttonRemoveAction = self.removeFriend
        return cell!
    }
}
