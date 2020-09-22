//
//  MainScreenController.swift
//  Xiritori
//
//  Created by Pedro Henrique Costa on 21/09/20.
//  Copyright © 2020 Academy IFCE. All rights reserved.
//

import UIKit

class MainScreenController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

		self.view.backgroundColor = .seriousPurple
		setupPlayButton()
		setupOptionsButton()
		setupFriendsButton()
    }
    
	func setupPlayButton() {
		
		let button = UIButton()
		button.backgroundColor = .lightGreen
		button.setTitleColor(.blazingBlack, for: .normal)
		button.titleLabel?.font = UIFont(name: "MyMessyHandwriting", size: 64)
		button.setTitle("JOGAR", for: .normal)
		button.addTarget(self, action: #selector(self.pressedPlay), for: .touchUpInside)
		self.view.addSubview(button)
		
		button.translatesAutoresizingMaskIntoConstraints = false
		let buttonWidthConstraint = button.widthAnchor.constraint(equalToConstant: 300)
		let buttonHeightConstraint = button.heightAnchor.constraint(equalToConstant: 150)
		let buttonHorizontalConstraint = button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: -50)
		let buttonVerticalConstraint = button.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: -100)
		NSLayoutConstraint.activate([buttonWidthConstraint, buttonHeightConstraint, buttonHorizontalConstraint, buttonVerticalConstraint])
		
		button.transform = button.transform.rotated(by: 150)
		
		let circlePath = UIBezierPath.init(arcCenter: CGPoint(x: 150, y: 150), radius: 150, startAngle: CGFloat(Double.pi), endAngle: 0.0, clockwise: true)
		let circleShape = CAShapeLayer()
		circleShape.path = circlePath.cgPath
		button.layer.mask = circleShape
	}
	
	@objc func pressedPlay() {
		self.view.backgroundColor = .systemGreen
	}
	
	func setupFriendsButton() {
		
		let button = UIButton()
		button.backgroundColor = .blazingBlack
		button.addTarget(self, action: #selector(self.pressedFriends), for: .touchUpInside)
		self.view.addSubview(button)
		
		let label = UILabel()
		label.text = "AMIGOS"
		label.textColor = .blazingBlack
		label.font = UIFont(name: "MyMessyHandwriting", size: 32)
		button.addSubview(label)
		
		label.translatesAutoresizingMaskIntoConstraints = false
		let labelWidthConstraint = label.widthAnchor.constraint(equalToConstant: 150)
		let labelHeightConstraint = label.heightAnchor.constraint(equalToConstant: 40)
		let labelHorizontalConstraint = label.centerXAnchor.constraint(equalTo: button.centerXAnchor, constant: 10)
		let labelVerticalConstraint = label.centerYAnchor.constraint(equalTo: button.centerYAnchor, constant: -2)
		NSLayoutConstraint.activate([labelWidthConstraint, labelHeightConstraint, labelHorizontalConstraint, labelVerticalConstraint])
		
		label.transform = label.transform.rotated(by: 4.2)
		
		button.translatesAutoresizingMaskIntoConstraints = false
		let widthConstraint = button.widthAnchor.constraint(equalToConstant: 150)
		let heightConstraint = button.heightAnchor.constraint(equalToConstant: 150)
		let horizontalConstraint = button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 112)
		let verticalConstraint = button.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: -48.5)
		NSLayoutConstraint.activate([widthConstraint, heightConstraint, horizontalConstraint, verticalConstraint])
		
		button.transform = button.transform.rotated(by: 14.908)
		
		let circlePath = UIBezierPath.init(arcCenter: CGPoint(x: 150, y: 150), radius: 150, startAngle: CGFloat(Double.pi/2), endAngle: 0.0, clockwise: true)
		let circleShape = CAShapeLayer()
		circleShape.path = circlePath.cgPath
		button.layer.mask = circleShape
	}
	
	@objc func pressedFriends() {
		self.view.backgroundColor = .systemOrange
	}
	
	func setupOptionsButton() {
		
		let button = UIButton()
		button.backgroundColor = .lightRed
		button.addTarget(self, action: #selector(self.pressedOptions), for: .touchUpInside)
		self.view.addSubview(button)
		
		let label = UILabel()
		label.text = "OPÇÖES"
		label.textColor = .blazingBlack
		label.font = UIFont(name: "MyMessyHandwriting", size: 32)
		button.addSubview(label)
		
		label.translatesAutoresizingMaskIntoConstraints = false
		let labelWidthConstraint = label.widthAnchor.constraint(equalToConstant: 150)
		let labelHeightConstraint = label.heightAnchor.constraint(equalToConstant: 40)
		let labelHorizontalConstraint = label.centerXAnchor.constraint(equalTo: button.centerXAnchor, constant: -30)
		let labelVerticalConstraint = label.centerYAnchor.constraint(equalTo: button.centerYAnchor, constant: -2)
		NSLayoutConstraint.activate([labelWidthConstraint, labelHeightConstraint, labelHorizontalConstraint, labelVerticalConstraint])
		
		label.transform = label.transform.rotated(by: 4)
		
		button.translatesAutoresizingMaskIntoConstraints = false
		let widthConstraint = button.widthAnchor.constraint(equalToConstant: 150)
		let heightConstraint = button.heightAnchor.constraint(equalToConstant: 150)
		let horizontalConstraint = button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 6.5)
		let verticalConstraint = button.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: 60)
		NSLayoutConstraint.activate([widthConstraint, heightConstraint, horizontalConstraint, verticalConstraint])
		
		button.transform = button.transform.rotated(by: 14.908)
		
		let circlePath = UIBezierPath.init(arcCenter: CGPoint(x: 0, y: 150), radius: 150, startAngle: CGFloat(Double.pi/2), endAngle: 0.0, clockwise: true)
		let circleShape = CAShapeLayer()
		circleShape.path = circlePath.cgPath
		button.layer.mask = circleShape
	}
	
	@objc func pressedOptions() {
		self.view.backgroundColor = .systemRed
	}
}
