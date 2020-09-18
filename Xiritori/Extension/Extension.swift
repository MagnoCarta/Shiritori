//
//  Extension.swift
//  Xiritori
//
//  Created by Elias Ferreira on 13/09/20.
//  Copyright © 2020 Academy IFCE. All rights reserved.
//

import Foundation
import UIKit


extension ChatGame {
    
    
    func addConstraintTextField(){
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        textBottomAnchor = textField.bottomAnchor.constraint(equalTo: self.bottomAnchor,constant:  -20)
        NSLayoutConstraint.activate([
       textBottomAnchor,
        textField.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -70),
        textField.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 30),
       // textField.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    func addConstraintShape() {
        addSubview(whiteBlueLineBot)
        shape.translatesAutoresizingMaskIntoConstraints = false
        shapeBottomAnchor = shape.bottomAnchor.constraint(equalTo: self.bottomAnchor,constant: 0)
        NSLayoutConstraint.activate([shapeBottomAnchor,shape.leadingAnchor.constraint(equalTo: self.leadingAnchor),
                                     shape.trailingAnchor.constraint(equalTo: self.trailingAnchor), shape.heightAnchor.constraint(equalToConstant: 70)
        ])
        whiteBlueLineBot.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
        whiteBlueLineBot.topAnchor.constraint(equalTo: shape.topAnchor),whiteBlueLineBot.leadingAnchor.constraint(equalTo: self.leadingAnchor),
        whiteBlueLineBot.trailingAnchor.constraint(equalTo: self.trailingAnchor),whiteBlueLineBot.heightAnchor.constraint(equalToConstant: 3)
        ])
        
    
    }
    
    func addConstraintButton() {

        buttonSendText.translatesAutoresizingMaskIntoConstraints = false
        buttonSenTextBottom = buttonSendText.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20)
        NSLayoutConstraint.activate([
            buttonSenTextBottom,
            buttonSendText.leadingAnchor.constraint(equalTo: self.textField.trailingAnchor, constant: 14),
            buttonSendText.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15),
            buttonSendText.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        
    }
    
    
    func addConstraintShapeTop() {
        addSubview(whiteBlueLineTop)
         
        shapeTop.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([shapeTop.topAnchor.constraint(equalTo: self.topAnchor,constant: 0),shapeTop.leadingAnchor.constraint(equalTo: self.leadingAnchor),
                                     shapeTop.trailingAnchor.constraint(equalTo: self.trailingAnchor), shapeTop.heightAnchor.constraint(equalToConstant: 150)])
        whiteBlueLineTop.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
        whiteBlueLineTop.bottomAnchor.constraint(equalTo: shapeTop.bottomAnchor),whiteBlueLineTop.leadingAnchor.constraint(equalTo: self.leadingAnchor),
        whiteBlueLineTop.trailingAnchor.constraint(equalTo: self.trailingAnchor),whiteBlueLineTop.heightAnchor.constraint(equalToConstant: 3)
        ])
        
        
        
    }
    
    
    
    
    func addConstraintRelogio() {
        
        
//        relogio.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//        
//        
//        ])
        
        
    }
    
}




