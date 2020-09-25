//
//  PlayScreenView.swift
//  Xiritori
//
//  Created by Pedro Henrique Costa on 22/09/20.
//  Copyright © 2020 Academy IFCE. All rights reserved.
//

import UIKit

class PlayScreenView: UIView {

	let computerButton = UIButton()
	let playerButton = UIButton()
	
    override init(frame: CGRect) {
        super.init(frame: frame)
		self.backgroundColor = .seriousPurple
		
		setupBackgroundImage()
		setupComputerButton()
		setupPlayerButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

	// MARK: - Setup Buttons
	func setupComputerButton() {
		
		computerButton.backgroundColor = .orangeChat
		computerButton.setTitleColor(.blazingBlack, for: .normal)
		computerButton.titleLabel?.font = UIFont(name: "MyMessyHandwriting", size: 32)
		computerButton.setTitle("VS COMPUTADOR", for: .normal)
		self.addSubview(computerButton)
		
		computerButton.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			computerButton.widthAnchor.constraint(equalToConstant: 300),
			computerButton.heightAnchor.constraint(equalToConstant: 150),
			computerButton.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: -50),
			computerButton.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -100)
		])
		
		computerButton.transform = computerButton.transform.rotated(by: 150)
		
		let circlePath = UIBezierPath.init(arcCenter: CGPoint(x: 150, y: 150), radius: 150, startAngle: CGFloat(Double.pi), endAngle: 0.0, clockwise: true)
		let circleShape = CAShapeLayer()
		circleShape.path = circlePath.cgPath
		computerButton.layer.mask = circleShape
	}
	
	func setupPlayerButton() {
		
		playerButton.backgroundColor = .lightGreen
		playerButton.setTitleColor(.blazingBlack, for: .normal)
		playerButton.titleLabel?.font = UIFont(name: "MyMessyHandwriting", size: 32)
		playerButton.setTitle("VS JOGADOR", for: .normal)
		self.addSubview(playerButton)
		
		playerButton.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			playerButton.widthAnchor.constraint(equalToConstant: 300),
			playerButton.heightAnchor.constraint(equalToConstant: 150),
			playerButton.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 60),
			playerButton.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 5)
		])
		
		playerButton.transform = playerButton.transform.rotated(by: 150)
		
		let circlePath = UIBezierPath.init(arcCenter: CGPoint(x: 150, y: 0), radius: 150, startAngle: 0.0, endAngle: CGFloat(Double.pi), clockwise: true)
		let circleShape = CAShapeLayer()
		circleShape.path = circlePath.cgPath
		playerButton.layer.mask = circleShape
	}
	
}
