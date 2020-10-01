//
//  FriendsTableViewCell.swift
//  Xiritori
//
//  Created by Elias Ferreira on 18/09/20.
//  Copyright © 2020 Academy IFCE. All rights reserved.
//

import UIKit

class FriendsTableViewCell: UITableViewCell {
    var uid: String?
    var position: Int?
// MARK: - VIEWS
    
    // Image Character.
    lazy var imageViewCell: UIImageView = {
        let image = UIImageView(image: UIImage(named: "bart"))
        image.layer.borderColor = UIColor.gray.cgColor
        image.layer.borderWidth = 0.5
        image.contentMode = .scaleAspectFit
        image.layer.cornerRadius = 30
        image.clipsToBounds = true
        return image
        
    }()
    // Label Name.
    lazy var labelName: UILabel = {
        let label = UILabel()
        label.text = "Amigo1#93493"
        label.font = UIFont(name: "Comfortaa", size: 17)
        label.textColor = .blazingBlack
        return label
    }()
    // Button to remove friend.
    lazy var buttonRemove: UIButton = {
        let button = UIButton()
        button.setTitle("Remover", for: .normal)
        button.backgroundColor = .lightRed
        button.layer.borderColor = UIColor.gray.cgColor
        button.layer.borderWidth = 0.5
        button.layer.cornerRadius = 15
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont(name: "MyMessyHandwriting", size: 20)
        button.addTarget(self, action: #selector(removeAction), for: .touchDown)
        return button
    }()
    // Button to play with.
    lazy var buttonPlusVS: UIButton = {
        let button = UIButton()
        button.setTitle("VS", for: .normal)
        button.backgroundColor = .lightGreen
        button.layer.borderColor = UIColor.gray.cgColor
        button.layer.borderWidth = 0.5
        button.layer.cornerRadius = 15
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont(name: "MyMessyHandwriting", size: 25)
        button.addTarget(self, action: #selector(vsPlusAction), for: .touchUpInside)
        return button
    }()

// MARK: - INIT
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .backgroundColor
        self.contentView.addSubviews(
            imageViewCell,
            labelName,
            buttonRemove,
            buttonPlusVS
        )
        self.setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
    }
    
 // MARK: - ACTIONS
    
    var buttonVsPlusAction: ((String) -> Void)!
    @objc func vsPlusAction() {
        buttonVsPlusAction(self.uid!)
    }
    
    var buttonRemoveAction: ((String, Int) -> Void)!
    @objc func removeAction() {
        buttonRemoveAction(self.uid!, self.position!)
    }
    
// MARK: - FUNCS
    
    func setupCellForAddFriend() {
        buttonRemove.removeFromSuperview()
        labelName.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        buttonPlusVS.setTitle("+", for: .normal)
        buttonPlusVS.titleLabel?.font = UIFont(name: "MyMessyHandwriting", size: 40)
    }
    
    func config(user: User) {
        self.labelName.text = user.username
        self.uid = user.id
    }
    
    func config(friend: Friend, position: Int) {
        self.labelName.text = friend.username
        self.uid = friend.id
        self.position = position
    }

// MARK: - CONSTRAINTS
    
    func setupLayout() {
        imageViewCell.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageViewCell.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            imageViewCell.widthAnchor.constraint(equalToConstant: 60),
            imageViewCell.heightAnchor.constraint(equalToConstant: 60),
            imageViewCell.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 17.5)
        ])
        
        labelName.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            labelName.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 17.5),
            labelName.leftAnchor.constraint(equalTo: imageViewCell.rightAnchor, constant: 17.5),
            labelName.rightAnchor.constraint(equalTo: buttonPlusVS.leftAnchor, constant: -17.5)
        ])
        
        buttonRemove.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            buttonRemove.topAnchor.constraint(equalTo: labelName.bottomAnchor, constant: 8),
            buttonRemove.leftAnchor.constraint(equalTo: imageViewCell.rightAnchor, constant: 17.5),
            buttonRemove.heightAnchor.constraint(equalToConstant: 30),
            buttonRemove.widthAnchor.constraint(equalToConstant: 120)
        ])
        
        buttonPlusVS.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            buttonPlusVS.heightAnchor.constraint(equalToConstant: 60),
            buttonPlusVS.widthAnchor.constraint(equalToConstant: 75),
            buttonPlusVS.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -17.5),
            buttonPlusVS.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
}
