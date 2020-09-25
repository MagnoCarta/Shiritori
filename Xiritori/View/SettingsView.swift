//
//  SettingsView.swift
//  Xiritori
//
//  Created by Gilberto Magno on 9/24/20.
//  Copyright © 2020 Academy IFCE. All rights reserved.
//

import Foundation
import UIKit



class SettingsView: UIView {
    
    let yourImage: UIImageView = UIImageView()
    let name: UILabel = UILabel()
    let tableViewNotifications = UITableView()
    let tableViewSound = UITableView()
    
    
     override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .seriousPurple
        
        addSubview(yourImage)
        addSubview(name)
        addSubview(tableViewSound)
        addSubview(tableViewNotifications)
        
        
        addConstraintYourImage()
        addConstraintYourName()
        addConstraintTableViewSounds()
        addConstraintTableViewNotifications()
        
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
