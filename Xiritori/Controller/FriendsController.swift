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
        friendsView.tableView.delegate = self
        friendsView.tableView.dataSource = self
        self.configureNavBar()
        
        self.friendsView.tableView.register(FriendsTableViewCell.self, forCellReuseIdentifier: "FriendCell")
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        friendsView.addGestureRecognizer(tap)
    }
// MARK: - ACTIONS
    
    @objc func addFriend() {
        print("Add Friend")
    }
// MARK: - FUNCS
    private func configureNavBar() {
        navigationItem.title = "Lista de Amigos"
        // Always use Light Mode.
        navigationController?.overrideUserInterfaceStyle = .light
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.standardAppearance.configureWithTransparentBackground()
        navigationController?.navigationBar.topItem?.rightBarButtonItem = barButton
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

// MARK: - UITableView Delegate and DataSource

extension FriendsController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "FriendCell", for: indexPath) as? FriendsTableViewCell
        
//        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        
//        cell.selectionStyle = .none
//        cell.backgroundColor = .clear
//        cell.textLabel?.text = "Title \(indexPath.row)"
//        cell.detailTextLabel?.text = "Body \(indexPath.row)"
        
        return cell!
    }
}
