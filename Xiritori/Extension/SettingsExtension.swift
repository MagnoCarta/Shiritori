//
//  SettingsExtension.swift
//  Xiritori
//
//  Created by Gilberto Magno on 9/25/20.
//  Copyright © 2020 Academy IFCE. All rights reserved.
//

import Foundation
import UIKit

extension SettingsView {
    
    func addConstraintYourImage() {
        yourImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            yourImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 120),
            yourImage.heightAnchor.constraint(equalToConstant: 80),
            yourImage.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -167),
            yourImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 167)
        ])
        
        yourImage.contentMode = .scaleAspectFit
        yourImage.layer.cornerRadius = 37
        yourImage.backgroundColor = .orangeChat
    }
    
    func addConstraintYourName() {
        
        name.translatesAutoresizingMaskIntoConstraints = false
        name.font = UIFont(name: "Comfortaa", size: 20)
        name.textColor = .white
        name.text = "Username#991"
        NSLayoutConstraint.activate([name.topAnchor.constraint(equalTo: yourImage.bottomAnchor,constant: 0),
            name.centerXAnchor.constraint(equalTo: yourImage.centerXAnchor)
        ])
    }
    
    func addConstraintTableViewNotifications() {
        tableViewNotification.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([tableViewNotification.topAnchor.constraint(equalTo: self.name.bottomAnchor),tableViewNotification.bottomAnchor.constraint(equalTo: self.bottomAnchor,constant: -170),
            tableViewNotification.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            tableViewNotification.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    }
    
    func addConstraintTableViewSounds() {
        
    }
    
}

extension UIImageView {

}
