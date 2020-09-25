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

        clockTime()
        
    }
    func clockTime() {
        
        var tempo: Double = 0
        var inversalTime: Double = 6.18
        Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { timer in
            tempo += 0.01
            inversalTime -= 0.01
            
         //   circle.move(to: .zero)
            let circle = UIBezierPath.init(arcCenter: CGPoint(x: UIScreen.main.bounds.width/2, y: 90), radius: 35, startAngle: 0, endAngle:
											CGFloat(inversalTime), clockwise: true)
            let circleShape = CAShapeLayer()
            circleShape.path = circle.cgPath
            circleShape.fillColor = UIColor.lightRed.cgColor
            self.layer.addSublayer(circleShape)
            var tempoEspera: Double = 0
            Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { etimer in
                tempoEspera += 0.01
                if tempoEspera > 0.02 {
                    circleShape.removeFromSuperlayer()
                    etimer.invalidate()
                }
                
            }
            if tempo > 6.17 {
                timer.invalidate()
            }
        }
        
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
        let keyboardSize = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect
            guard let tamanhoTextField = keyboardSize?.height else {return }
        UIView.animate(withDuration: 0.25) {
            self.textBottomAnchor.constant -= tamanhoTextField
            self.shapeBottomAnchor.constant -= tamanhoTextField
            self.buttonSenTextBottom.constant -= tamanhoTextField
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
    
    @objc func  giveUp() {
      
        //Codigo apos integracao
    }
}

extension ChatGame: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        mensagemMockada.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Cells.chatCell) as? ChatCell else {
            return UITableViewCell() }
        let messages = mensagemMockada[indexPath.row]
        cell.set(message: messages)
        return cell
    }
}
