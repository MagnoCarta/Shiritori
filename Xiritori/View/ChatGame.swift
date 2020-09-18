//
//  ChatGame.swift
//  Xiritori
//
//  Created by Gilberto Magno on 9/16/20.
//  Copyright © 2020 Academy IFCE. All rights reserved.
//

import Foundation
import UIKit


class ChatGame: UIView {
    
    var firstResponder = false
    let textField: UITextField = {
        var textFil = UITextField()
        textFil.font = UIFont.systemFont(ofSize: 16)
        textFil.borderStyle = UITextField.BorderStyle.roundedRect
        textFil.autocorrectionType = UITextAutocorrectionType.no
        textFil.keyboardType = UIKeyboardType.default
        textFil.returnKeyType = UIReturnKeyType.done
        textFil.clearButtonMode = UITextField.ViewMode.whileEditing
        textFil.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
      //  textFil.placeholder = "Enter text here"
        textFil.layer.borderWidth = 1
        textFil.layer.cornerRadius = 16
        textFil.backgroundColor = .white
        textFil.clipsToBounds = true
        textFil.borderStyle = .roundedRect
        
        return textFil
    }()
    
    let buttonSendText: UIButton = {
        let button = UIButton(type: .roundedRect)
        button.backgroundColor = .lightGreen
        button.layer.cornerRadius = 13
       return button
    }()
    var buttonSenTextBottom = NSLayoutConstraint()
    
    var tamanhoTextField = CGFloat(300)
    var textBottomAnchor = NSLayoutConstraint()
    let shape = UIView()
    var shapeBottomAnchor = NSLayoutConstraint()
    let shapeTop = UIView()
    let whiteBlueLineTop = UIView()
    let whiteBlueLineBot = UIView()
    let tableView = UITableView()
    
    
    override init(frame: CGRect) {
        
        
        
        
        
        
        super.init(frame: frame)
        shape.backgroundColor = .seriousPurple
        shapeTop.backgroundColor = .seriousPurple
        whiteBlueLineBot.backgroundColor = UIColor(red: 0, green: 220/255, blue: 195/255, alpha: 1)
        whiteBlueLineTop.backgroundColor = UIColor(red: 0, green: 220/255, blue: 195/255, alpha: 1)
        addSubview(shapeTop)
        addSubview(shape)
        addSubview(textField)
        addSubview(buttonSendText)
        addConstraintTextField()
        addConstraintShape()
        addConstraintButton()
        addConstraintShapeTop()
        self.backgroundColor = .backgroundColor
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        self.addGestureRecognizer(tap)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillAppear), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        
        let animatedCircle = AnimatedCircle()
        self.addSubview(animatedCircle)
        animatedCircle.runAnimation()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    @objc func dismissKeyboard() {
        
         self.endEditing(true)
        if firstResponder {
        UIView.animate(withDuration: 1) {
            self.textBottomAnchor.constant +=  self.tamanhoTextField
            self.shapeBottomAnchor.constant += self.tamanhoTextField
            self.buttonSenTextBottom.constant += self.tamanhoTextField
            self.layoutIfNeeded()
            }
            firstResponder = !firstResponder
        }
     }
    
    @objc func keyboardWillAppear(notification: Notification) {
        if !firstResponder {
        let keyboardSize = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as! CGRect
        tamanhoTextField = keyboardSize.height
        UIView.animate(withDuration: 0.25) {
            self.textBottomAnchor.constant -= keyboardSize.height
            self.shapeBottomAnchor.constant -= keyboardSize.height
            self.buttonSenTextBottom.constant -= keyboardSize.height
            self.layoutIfNeeded()
        }
            firstResponder = !firstResponder
        }
    
    
}
    
    
    @objc func sendMessage() {
        //Muitas verificacoes pra depois, lembre-se
        
        let textSent = textField.text
        
        
        
        
        
    }
    
    
    
    
    
   

}
