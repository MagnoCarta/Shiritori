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
    
    let yourImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "GalinhaSozinha")
        
        return image
    }()
    let name: UILabel = UILabel()
    let tableViewSound = UITableView()
    var notificationTableMessages = ["Habilitar Notificacoes de Amizade","Habilitar notificacoes de convite"]
    let tableViewNotification = UITableView()
    
    //    let firstTableViewName = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        tableViewNotification.largeContentTitle = "Notificacao"
        self.backgroundColor = .seriousPurple
        
        addSubview(yourImage)
        addSubview(name)
        addSubview(tableViewSound)
        addSubview(tableViewNotification)
        
        delegates()
        tableViewNotification.rowHeight = 40
        // tableViewNotification.separatorStyle = .none
        tableViewNotification.register(SettingsCell.self, forCellReuseIdentifier: Cells.notificationSettingsCell)
        tableViewNotification.backgroundColor = .backgroundColor
        tableViewNotification.allowsSelection = false
        
        
        addConstraintYourImage()
        addConstraintYourName()
        addConstraintTableViewSounds()
        addConstraintTableViewNotifications()
    }
    
    func delegates() {
        tableViewNotification.delegate = self
        tableViewNotification.dataSource = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SettingsView: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
          return  2
        } else{
           return 1
        }
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section <= 1 {
        return CGFloat(60)
        }else{
            return CGFloat(224)
        }
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Cells.notificationSettingsCell) as? SettingsCell else {
            return UITableViewCell() }

        let messages = notificationTableMessages[0]
        if messages == "Volume" {
            notificationTableMessages.removeAll()
            notificationTableMessages.append("Sair")
        } else {
        notificationTableMessages.removeFirst()
        notificationTableMessages.append("Volume")
        }
        cell.set(text: messages)
        return cell
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection
                    section: Int) -> String? {
        if section == 0 {
        return "Notificaçōes"
        } else if section == 1 {
            return "Audio"
        } else {
            return " "
        }
    }
}
