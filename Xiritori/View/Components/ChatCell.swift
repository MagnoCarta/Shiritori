//
//  ChatCell.swift
//  Xiritori
//
//  Created by Gilberto Magno on 9/18/20.
//  Copyright © 2020 Academy IFCE. All rights reserved.
//

import Foundation
import UIKit


class ChatCell: UITableViewCell {
    
    let chatBubble = UIView()
    let message = UILabel()
    static var isPlayer = true
    static var isOponent = true
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(chatBubble)
        addSubview(message)
        organizeMessage()
        organizeBubble()
        print("1")
        messageConstraints()
        bubbleConstraints()
        self.backgroundColor = .backgroundColor
        
    }
    
    func set(message: String) {
        print("2")
        self.message.text = message
        
        if ChatCell.isPlayer {
            ChatCell.isPlayer = !ChatCell.isPlayer
            chatBubble.backgroundColor = .lightGreen
            
        }else {
            ChatCell.isPlayer = !ChatCell.isPlayer
            chatBubble.backgroundColor = .orangeChat
            
        }
        
        
    }
    
    func organizeMessage() {
        
        self.message.numberOfLines = 0
        self.message.adjustsFontSizeToFitWidth = true
        self.message.font = UIFont(name: "Comfortaa", size: 30)
        
    }
    
    func organizeBubble() {
        
        chatBubble.layer.cornerRadius = 18
        
    }
    
    
    func bubbleConstraints() {
        
        chatBubble.translatesAutoresizingMaskIntoConstraints = false
        
        if !ChatCell.isOponent {
            ChatCell.isOponent = !ChatCell.isOponent
            
            NSLayoutConstraint.activate([
            chatBubble.heightAnchor.constraint(equalToConstant: 50),
            chatBubble.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            chatBubble.leadingAnchor.constraint(equalTo: self.centerXAnchor,constant: -30),
            chatBubble.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -15)
            ])
            
            
            
        }else {
            
            ChatCell.isOponent = !ChatCell.isOponent
            
            NSLayoutConstraint.activate([
            chatBubble.heightAnchor.constraint(equalToConstant: 50),
            chatBubble.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            chatBubble.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            chatBubble.trailingAnchor.constraint(equalTo: self.centerXAnchor, constant: 30)
            ])
            
        }
        
        
        
    }
    
    func messageConstraints(){
   
        message.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            message.heightAnchor.constraint(equalToConstant: 30),
            message.leadingAnchor.constraint(equalTo: chatBubble.leadingAnchor, constant: 10),
            message.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            message.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
            
        
    }
    
    
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
