//
//  FriendsController.swift
//  Xiritori
//
//  Created by Elias Ferreira on 17/09/20.
//  Copyright © 2020 Academy IFCE. All rights reserved.
//

import UIKit

class FriendsController: UIViewController {
    let repository = FriendRepository()
    
    // Temporaly! Update it with the session model.
    //let token = "Ej4UxrTcO7o/1XnZMKwXKw=="
    
    var session: Session?
    
    var friends = [Friend]() {
        didSet {
            self.friendsView.tableView.reloadData()
        }
    }
    
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
    
    override func viewWillAppear(_ animated: Bool) {
        self.updateFriend()
    }
    
// MARK: - ACTIONS
    
    @objc func addFriend() { // Plus button action.
        let addFriendController = AddFriendController()
        if let session = self.session {
            addFriendController.session = session
        }
        addFriendController.updateParentModel = updateFriend
        navigationController?.present(addFriendController, animated: true, completion: nil)
    }
    
    func vsAction(uid: String?) { // Action to button vs.
        print("VS")
    }
    
    func removeFriend(fid: String, position: Int) {// Action to remove a friend.
        if let session = self.session {
            repository.remove(token: session.token, fid: fid) { result in
                if result {
                    print("Removido com sucesso!")
                    DispatchQueue.main.async {
                        self.friends.remove(at: position)
                    }
                }
            }
        }
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
    
    // Update Model
    func updateFriend() {
        if let session = self.session {
            repository.list(token: session.token) { friends in
                if let friends = friends {
                    DispatchQueue.main.async {
                        self.friends = friends
                    }
                } else {
                    DispatchQueue.main.async {
                        self.showErrorMessage("Algo deu errado com o servidor!")
                    }
                }
            }
        }
    }
    
    func showErrorMessage(_ message: String) {
        let dialogMessage = UIAlertController(title: "Erro!", message: message, preferredStyle: .alert)
        // Create OK button with action handler
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        //Add Cancel button to an Alert object
        dialogMessage.addAction(cancel)
        // Present alert message to user
        self.present(dialogMessage, animated: true, completion: nil)
        //dialogMessage.setMessage(font: UIFont(name: "Comfortaa", size: 18), color: .black)
        dialogMessage.setTitle(font: UIFont(name: "Comfortaa-Bold", size: 20), color: .lightRed)
    }
}

// MARK: - TableView Delegate and DataSource

extension FriendsController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.friends.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FriendCell", for: indexPath) as? FriendsTableViewCell
        cell?.buttonVsPlusAction = self.vsAction
        cell?.buttonRemoveAction = self.removeFriend
        cell?.config(friend: self.friends[indexPath.row], position: indexPath.row)
        return cell!
    }
}
