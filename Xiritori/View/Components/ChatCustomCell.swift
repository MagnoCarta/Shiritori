//
//  ChatCell.swift
//  Xiritori
//
//  Created by Gilberto Magno on 9/18/20.
//  Copyright © 2020 Academy IFCE. All rights reserved.
//

import Foundation
import UIKit

class ChatCustomCell: UITableViewCell {
    
    let chatBubble: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 18
        return view
    }()
    
    let message: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.font = UIFont(name: "Comfortaa", size: 30)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    enum Direction {
        case left, right
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .backgroundColor
        selectionStyle = .none
        buildViewHierarchy()
        
        switch reuseIdentifier {
        case Cells.chatCellSender:
            setupConstraintsSender()
        default:
            setupConstraintsReciever()
        }
    }
    
    func set(message: Message) {
        self.message.text = message.text
        switch message.from {
        case .me:
            chatBubble.backgroundColor = .lightGreen
        case .enemy:
            chatBubble.backgroundColor = .orangeChat
        }
    }
    
    func buildViewHierarchy() {
        addSubview(chatBubble)
        chatBubble.addSubview(message)
    }
    
    func setupConstraintsSender() {
        
        NSLayoutConstraint.activate([
            chatBubble.heightAnchor.constraint(equalToConstant: 50),
            chatBubble.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            chatBubble.leadingAnchor.constraint(greaterThanOrEqualTo: self.leadingAnchor, constant: 25),
            chatBubble.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15)
        ])
        
        NSLayoutConstraint.activate([
            message.leadingAnchor.constraint(equalTo: chatBubble.leadingAnchor, constant: 15),
            message.trailingAnchor.constraint(equalTo: chatBubble.trailingAnchor, constant: -15),
            message.centerYAnchor.constraint(equalTo: chatBubble.centerYAnchor)
        ])
    }
    
    func setupConstraintsReciever() {
        NSLayoutConstraint.activate([
            chatBubble.heightAnchor.constraint(equalToConstant: 50),
            chatBubble.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            chatBubble.trailingAnchor.constraint(lessThanOrEqualTo: self.trailingAnchor, constant: -25),
            chatBubble.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10)
        ])
        
        NSLayoutConstraint.activate([
            message.leadingAnchor.constraint(equalTo: chatBubble.leadingAnchor, constant: 15),
            message.trailingAnchor.constraint(equalTo: chatBubble.trailingAnchor, constant: -15),
            message.centerYAnchor.constraint(equalTo: chatBubble.centerYAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
