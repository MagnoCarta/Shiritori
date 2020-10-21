//
//  ChatGame.swift
//  Xiritori
//
//  Created by Gilberto Magno on 9/16/20.
//  Copyright © 2020 Academy IFCE. All rights reserved.
//

import Foundation
import UIKit

class ChatGameRootView: UIView {
    
    lazy var messagesTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.rowHeight = 80
        tableView.allowsSelection = false
        tableView.translatesAutoresizingMaskIntoConstraints = false 
        tableView.separatorStyle = .none
        tableView.register(ChatCustomCell.self, forCellReuseIdentifier: Cells.chatCellSender)
        tableView.register(ChatCustomCell.self, forCellReuseIdentifier: Cells.chatCellReciever)
        tableView.backgroundColor = .backgroundColor
        return tableView
    }()
    
    let painelView: PainelGameChatView = {
        let view = PainelGameChatView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let messageInputContainer: MessageInputContainerView = {
        let container = MessageInputContainerView()
        container.translatesAutoresizingMaskIntoConstraints = false
        return container
    }()
    
    var bottomConstraint: NSLayoutConstraint?
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func buildViewHierarchy() {
        addSubview(painelView)
        addSubview(messageInputContainer)
        addSubview(messagesTableView)
    }
    
    func setupConstraints() {
        
        bottomConstraint = NSLayoutConstraint(item: messageInputContainer, attribute: .bottom,
                                              relatedBy: .equal, toItem: self, attribute: .bottom,
                                              multiplier: 1, constant: 0)
        
        self.addConstraint(bottomConstraint!)
        
        // Painel View Constraints
        NSLayoutConstraint.activate([
            painelView.topAnchor.constraint(equalTo: topAnchor),
            painelView.heightAnchor.constraint(equalToConstant: 160),
            painelView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            painelView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
        
        // Input Constraints
        NSLayoutConstraint.activate([
            messageInputContainer.heightAnchor.constraint(equalToConstant: 65),
            messageInputContainer.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            messageInputContainer.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            messageInputContainer.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
        
        // Table View Constraints
        NSLayoutConstraint.activate([
            messagesTableView.topAnchor.constraint(equalTo: painelView.bottomAnchor),
            messagesTableView.bottomAnchor.constraint(equalTo: self.messageInputContainer.topAnchor),
            messagesTableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            messagesTableView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        buildViewHierarchy()
        setupConstraints()
        keyboardActions()
    }
    
    func keyboardActions() {
        
        NotificationCenter
            .default
            .addObserver(self, selector: #selector(handleKeyboard),
                         name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter
            .default
            .addObserver(self, selector: #selector(handleKeyboard),
                         name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func handleKeyboard(notification: Notification) {
        
        if let userInfo = notification.userInfo {
            
            let keyboardFrame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect
            let isKeyboardShowing = notification.name == UIResponder.keyboardWillShowNotification
            
            bottomConstraint?.constant = isKeyboardShowing ? -keyboardFrame!.height : 0
            
            UIView.animate(withDuration: 0, delay: 0, options: .curveEaseOut) {
                self.layoutIfNeeded()
            }
            
        }
    }
}
