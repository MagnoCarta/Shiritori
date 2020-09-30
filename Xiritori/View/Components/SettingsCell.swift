//
//  SettingsCell.swift
//  Xiritori
//
//  Created by Gilberto Magno on 9/25/20.
//  Copyright © 2020 Academy IFCE. All rights reserved.
//

import Foundation
import UIKit

class SettingsCell: UITableViewCell {
    
    let textWritten = UILabel()
    let buttonOnOff = UISwitch()
    var slider: UISlider = {
        let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 1
        // Initial Value
        slider.value = UserDefaults.standard.float(forKey: "Volume")
        slider.contentMode = .center
        slider.addTarget(self, action: #selector(didChangeVolume(_:)), for: .touchDragInside)
        return slider
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.isUserInteractionEnabled = false
        addSubview(textWritten)
        organizeTextWritten()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
            
    @objc func didChangeVolume(_ slider: UISlider) {
        
    }
    
    func set(text: String) {
        
        self.textWritten.text = text
        if text == "Sair" {
            
            sairConstranit()
            self.textWritten.textColor = .red
        }else if text == "Volume"{
            textWrittenConstraint()
            addSubview(slider)
            slider.translatesAutoresizingMaskIntoConstraints = false
            slider.centerXAnchor.constraint(equalTo: self.textWritten.centerXAnchor).isActive = true
            slider.widthAnchor.constraint(equalToConstant: 200).isActive = true
        }else {
            addSubview(buttonOnOff)
            buttonOnOffConstraint()
            textWrittenConstraint()
        }
    }
    
    func organizeTextWritten() {
        
        textWritten.numberOfLines = 0
        textWritten.adjustsFontSizeToFitWidth = true
        textWritten.font = UIFont(name: "Comfortaa", size: 16)
        
    }
        
    func textWrittenConstraint() {
        textWritten.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            textWritten.heightAnchor.constraint(equalToConstant: 30),
            textWritten.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            textWritten.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            textWritten.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
        
    }
    
    func sairConstranit() {
        
        textWritten.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            textWritten.heightAnchor.constraint(equalToConstant: 30),
            textWritten.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            textWritten.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
        
    }
    
    func buttonOnOffConstraint() {
        
        buttonOnOff.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([buttonOnOff.heightAnchor.constraint(equalToConstant: self.buttonOnOff.frame.height),buttonOnOff.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -self.buttonOnOff.frame.width),
            buttonOnOff.centerYAnchor.constraint(equalTo: self.centerYAnchor)

        ])
        
    }
}


class SettingsCellSound: UITableViewCell {
    
    let textWritten = UILabel()
    let slider = UISlider()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.isUserInteractionEnabled = false
        addSubview(textWritten)
        addSubview(slider)
        organizeTextWritten()
        sliderConstraint()
        textWrittenConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
            
    func set(text: String) {
        
        self.textWritten.text = text
                
    }
    
    func organizeTextWritten() {
        
        textWritten.numberOfLines = 0
        textWritten.adjustsFontSizeToFitWidth = true
        textWritten.font = UIFont(name: "Comfortaa", size: 16)
        
    }
        
    func textWrittenConstraint() {
        textWritten.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            textWritten.heightAnchor.constraint(equalToConstant: 30),
            textWritten.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            textWritten.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            textWritten.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
        
    }
    
    func sliderConstraint() {
        
        slider.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([slider.heightAnchor.constraint(equalToConstant: self.slider.frame.height),slider.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -self.slider.frame.width),
                                     slider.centerYAnchor.constraint(equalTo: self.centerYAnchor)

        ])
        
    }
}
