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

    func addConstraintTextField() {

        textField.translatesAutoresizingMaskIntoConstraints = false
        textBottomAnchor = textField.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20)
        NSLayoutConstraint.activate([
			textBottomAnchor,
			textField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -70),
			textField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30)
       // textField.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    func addConstraintShape() {
        addSubview(whiteBlueLineBot)
        shape.translatesAutoresizingMaskIntoConstraints = false
        shapeBottomAnchor = shape.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0)
        NSLayoutConstraint.activate([
			shapeBottomAnchor,
			shape.leadingAnchor.constraint(equalTo: self.leadingAnchor),
			shape.trailingAnchor.constraint(equalTo: self.trailingAnchor),
			shape.heightAnchor.constraint(equalToConstant: 70)
        ])
        whiteBlueLineBot.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
			whiteBlueLineBot.topAnchor.constraint(equalTo: shape.topAnchor),
			whiteBlueLineBot.leadingAnchor.constraint(equalTo: self.leadingAnchor),
			whiteBlueLineBot.trailingAnchor.constraint(equalTo: self.trailingAnchor),
			whiteBlueLineBot.heightAnchor.constraint(equalToConstant: 3)
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
        
        NSLayoutConstraint.activate([
			shapeTop.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
			shapeTop.leadingAnchor.constraint(equalTo: self.leadingAnchor),
			shapeTop.trailingAnchor.constraint(equalTo: self.trailingAnchor),
			shapeTop.heightAnchor.constraint(equalToConstant: 150)])
        whiteBlueLineTop.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
			whiteBlueLineTop.bottomAnchor.constraint(equalTo: shapeTop.bottomAnchor),
			whiteBlueLineTop.leadingAnchor.constraint(equalTo: self.leadingAnchor),
			whiteBlueLineTop.trailingAnchor.constraint(equalTo: self.trailingAnchor),
			whiteBlueLineTop.heightAnchor.constraint(equalToConstant: 3)
        ])

    }

    func addConstraintTableView() {
        addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: shapeTop.bottomAnchor),
            tableView.bottomAnchor.constraint(equalTo: shape.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])

    }

    func addConstraintShapeGPoints() {
        shapeGreenPoints.translatesAutoresizingMaskIntoConstraints = false
        shapeGreenPoints.layer.cornerRadius = 13
        NSLayoutConstraint.activate([
        shapeGreenPoints.heightAnchor.constraint(equalToConstant: 30),
        shapeGreenPoints.bottomAnchor.constraint(equalTo: shapeTop.bottomAnchor, constant: -15),
        shapeGreenPoints.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 15),
        shapeGreenPoints.leadingAnchor.constraint(equalTo: self.centerXAnchor, constant: 90)
        ])
        
    }
    
    func addConstraintShapeOPoints() {
        shapeOrangePoints.translatesAutoresizingMaskIntoConstraints = false
        shapeOrangePoints.layer.cornerRadius = 13
        NSLayoutConstraint.activate([
        shapeOrangePoints.heightAnchor.constraint(equalToConstant: 30),
        shapeOrangePoints.bottomAnchor.constraint(equalTo: shapeGreenPoints.bottomAnchor, constant: -38),
        shapeOrangePoints.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 15),
        shapeOrangePoints.leadingAnchor.constraint(equalTo: self.centerXAnchor, constant: 90)
        ])
        
    }
    
    func addConstraintGPoints() {
        greenPoints.text = "300"
        greenPoints.font = UIFont(name: "Comfortaa", size: 30)
        greenPoints.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
                   greenPoints.heightAnchor.constraint(equalToConstant: 30),
                   greenPoints.leadingAnchor.constraint(equalTo: shapeGreenPoints.leadingAnchor, constant: 10),
                   greenPoints.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
                   greenPoints.centerYAnchor.constraint(equalTo: shapeGreenPoints.centerYAnchor)
               ])
        
    }
    
    func addConstraintOPoints() {
        orangePoints.text = "300"
        orangePoints.font = UIFont(name: "Comfortaa", size: 30)
        orangePoints.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
                   orangePoints.heightAnchor.constraint(equalToConstant: 30),
                   orangePoints.leadingAnchor.constraint(equalTo: shapeOrangePoints.leadingAnchor, constant: 10),
                   orangePoints.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
                   orangePoints.centerYAnchor.constraint(equalTo: shapeOrangePoints.centerYAnchor)
               ])
    }
}
extension UIAlertController {

  //Set background color of UIAlertController
  func setBackgroudColor(color: UIColor) {
    if let bgView = self.view.subviews.first,
      let groupView = bgView.subviews.first,
      let contentView = groupView.subviews.first {
      contentView.backgroundColor = color
    }
  }

  //Set title font and title color
  func setTitle(font: UIFont?, color: UIColor?) {
    guard let title = self.title else { return }
    let attributeString = NSMutableAttributedString(string: title)//1
    if let titleFont = font {
      attributeString.addAttributes([NSAttributedString.Key.font: titleFont],//2
        range:NSMakeRange(0, title.utf8.count))
    }
    if let titleColor = color {
      attributeString.addAttributes([NSAttributedString.Key.foregroundColor : titleColor],//3
        range:NSMakeRange(0, title.utf8.count))
    }
    self.setValue(attributeString, forKey: "attributedTitle")//4
  }

  //Set message font and message color
  func setMessage(font: UIFont?, color: UIColor?) {
    guard let title = self.message else {
      return
    }
    let attributedString = NSMutableAttributedString(string: title)
    if let titleFont = font {
        attributedString.addAttributes([NSAttributedString.Key.font:titleFont], range:NSMakeRange(0, title.utf8.count))
    }
    if let titleColor = color {
        attributedString.addAttributes([NSAttributedString.Key.foregroundColor:titleColor], range:NSMakeRange(0, title.utf8.count))
    }
    self.setValue(attributedString, forKey: "attributedMessage")//4
  }

  //Set tint color of UIAlertController
  func setTint(color: UIColor) {
    self.view.tintColor = color
  }

}
