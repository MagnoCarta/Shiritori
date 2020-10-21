//
//  chatGameController.swift
//  Xiritori
//
//  Created by Gilberto Magno on 9/14/20.
//  Copyright © 2020 Academy IFCE. All rights reserved.
//

import Foundation
import UIKit

class ChatGameController: UIViewController {
    
    let rootView = ChatGameRootView()
    
    var dataSource: [Message] = [
        Message(text: "Grande", from: .me),
        Message(text: "Eutenhdsadsadsadsadsadsadasd", from: .enemy),
        Message(text: "Inconstitucionalicamentent", from: .me),
        Message(text: "Palavra gigante", from: .enemy),
        Message(text: "Palavra", from: .me)
    ] {
        didSet {
            rootView.messagesTableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = rootView
        rootView.messagesTableView.allowsSelection = true
        rootView.messagesTableView.delegate = self
        rootView.messagesTableView.dataSource = self
        
        rootView
            .messageInputContainer
            .sendTextButton
            .addTarget(self, action: #selector(sendMessage), for: .touchUpInside)
    }
    
    @objc func sendMessage() {
        guard let textSent = rootView.messageInputContainer.inputMessageTextField.text else { return }
        let message = Message(text: textSent, from: .me)
        dataSource.append(message)
        // Dismiss Keyboard
        rootView.messageInputContainer.inputMessageTextField.resignFirstResponder()
        // Clear TextField
        rootView.messageInputContainer.inputMessageTextField.text = ""
    }
    
}

extension ChatGameController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let message = dataSource[indexPath.item]
        
        switch message.from {
        case .me:
            guard let cellSender = tableView.dequeueReusableCell(withIdentifier: Cells.chatCellSender) as? ChatCustomCell else {
                return UITableViewCell()
            }
            cellSender.set(message: message)
            return cellSender
        case .enemy:
            guard let cellReciever = tableView.dequeueReusableCell(withIdentifier: Cells.chatCellReciever) as? ChatCustomCell else {
                return UITableViewCell()
            }
            cellReciever.set(message: message)
            return cellReciever
        }
  
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.rootView.messageInputContainer.endEditing(true)
    }
}
