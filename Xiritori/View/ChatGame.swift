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
    let tableView = UITableView(frame: .zero, style: .grouped)
    var mensagemMockada: [String] = []
    let shapeGreenPoints = UIView()
    let greenPoints = UILabel()
    let shapeOrangePoints = UIView()
    let orangePoints = UILabel()
    var path: UIBezierPath!
    
    override init(frame: CGRect) {
        
        
        
        
        
        
        super.init(frame: frame)
        self.backgroundColor = .backgroundColor
        shape.backgroundColor = .seriousPurple
        shapeTop.backgroundColor = .seriousPurple
        shapeGreenPoints.backgroundColor = .lightGreen
        shapeOrangePoints.backgroundColor = .orangeChat
        whiteBlueLineBot.backgroundColor = .lightGreen
        whiteBlueLineTop.backgroundColor = .lightGreen
        
        addSubview(shapeTop)
        addSubview(shape)
        addSubview(textField)
        addSubview(buttonSendText)
        addSubview(shapeGreenPoints)
        addSubview(shapeOrangePoints)
        addSubview(greenPoints)
        addSubview(orangePoints)
        
        addConstraintTextField()
        addConstraintShape()
        addConstraintButton()
        addConstraintShapeTop()
        addConstraintTableView()
        addConstraintShapeGPoints()
        addConstraintShapeOPoints()
        addConstraintGPoints()
        addConstraintOPoints()
        
        delegates()
        tableView.rowHeight = 80
        tableView.separatorStyle = .none
        tableView.register(ChatCell.self, forCellReuseIdentifier: Cells.chatCell)
        tableView.backgroundColor = .backgroundColor
        buttonSendText.addTarget(self, action: #selector(sendMessage), for: .touchUpInside)
        keyboardActions()
        
        
        
        let circle = UIBezierPath.init(arcCenter: CGPoint(x: shapeTop.frame.midX, y: shapeTop.frame.midY), radius: 25, startAngle: 0, endAngle: 360, clockwise: true)
        let circleShape = CAShapeLayer()
        circleShape.path = circle.cgPath
        circleShape.fillColor = UIColor.myLightRed.cgColor
        self.layer.addSublayer(circleShape)
    }
    
    
   
    
    
    func keyboardActions() {
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        self.addGestureRecognizer(tap)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillAppear), name: UIResponder.keyboardWillShowNotification, object: nil)
        
    }
    
    func delegates() {
        
        tableView.delegate = self
        tableView.dataSource = self
        
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
        
        guard let textSent = textField.text else { return  }
        mensagemMockada.append(textSent)
        tableView.reloadData()
        
        
        
    }
    
    
    
    
    
   

}



extension ChatGame: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        mensagemMockada.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Cells.chatCell) as! ChatCell
        let messages = mensagemMockada[indexPath.row]
        cell.set(message: messages)
        return cell
    }
    
    
    
}
