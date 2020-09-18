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
    let isPlayer = true
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
    }
    
    func set(message: String) {
        
        self.message.text = message
        
        if isPlayer {
            
            chatBubble.backgroundColor = .lightGreen
            
        }else {
            
            chatBubble.backgroundColor = .orangeChat
            
        }
        
        
    }
    
    func organizeMessage() {
        
        self.message.numberOfLines = 0
        self.message.adjustsFontSizeToFitWidth = true
        
    }
    
    func organizeBubble() {
        
        
        
    }
    
    
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
