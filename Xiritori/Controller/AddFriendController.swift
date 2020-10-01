//
//  AddFriendController.swift
//  Xiritori
//
//  Created by Elias Ferreira on 21/09/20.
//  Copyright © 2020 Academy IFCE. All rights reserved.
//

import UIKit

class AddFriendController: UIViewController {
    let repository = UserRepository()
    let friendRepository = FriendRepository()
    
    // Temporaly! Update it with the session model.
    let token = "Ej4UxrTcO7o/1XnZMKwXKw=="
    
    var users = [User]() {
        didSet {
            self.addFriendView.tableView.reloadData()
        }
    }
    
// MARK: - VIEW
    
    lazy var addFriendView: AddFriend = {
        let addFriend = AddFriend()
        addFriend.tableView.delegate = self
        addFriend.tableView.dataSource = self
        addFriend.searchAction = self.search
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
    var updateParentModel: (() -> Void)!
    func plusAction(uid: String?) {
        self.friendRepository.add(token: self.token, fid: uid!) { result in
            if result {
                print("Adicionado com sucesso!")
                DispatchQueue.main.async {
                    self.dismiss(animated: true, completion: nil)
                    self.updateParentModel()
                }
            } else {
                print("Erro ao adicionar!")
            }
        }
    }
    
    func search() {
        let username = self.addFriendView.friendSearchBar.searchTextField.text!
        
        repository.search(username: username) { users in
            if let users = users {
                
                DispatchQueue.main.async {
                    self.users = users
                }
                    
                if users.count == 0 {
                    print("Nenhum usuário encontrado!")
                }
            } else {
                print("Algo deu errado!")
            }
        }
    }
}

// MARK: - TableView Delegate and DataSource

extension AddFriendController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "AddFriendCell",
            for: indexPath
        ) as? FriendsTableViewCell
        
        cell?.config(user: self.users[indexPath.row])
        cell?.setupCellForAddFriend()
        cell?.buttonVsPlusAction = self.plusAction
        return cell!
    }
}
