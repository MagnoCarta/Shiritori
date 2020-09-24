//
//  PlayScreenController.swift
//  Xiritori
//
//  Created by Pedro Henrique Costa on 22/09/20.
//  Copyright © 2020 Academy IFCE. All rights reserved.
//

import UIKit

class PlayScreenController: UIViewController {

    let playView = PlayScreenView()
	
    override func viewDidLoad() {
        super.viewDidLoad()
		self.view = playView
		
		setupComputerButton()
		setupPlayerButton()
    }
    
	func setupComputerButton() {
		
		let button = UIButton()
		button.backgroundColor = .orangeChat
		button.setTitleColor(.blazingBlack, for: .normal)
		button.titleLabel?.font = UIFont(name: "MyMessyHandwriting", size: 32)
		button.setTitle("VS COMPUTADOR", for: .normal)
		button.addTarget(self, action: #selector(self.pressedComputer), for: .touchUpInside)
		self.view.addSubview(button)
		
		button.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			button.widthAnchor.constraint(equalToConstant: 300),
			button.heightAnchor.constraint(equalToConstant: 150),
			button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: -50),
			button.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: -100)
		])
		
		button.transform = button.transform.rotated(by: 150)
		
		let circlePath = UIBezierPath.init(arcCenter: CGPoint(x: 150, y: 150), radius: 150, startAngle: CGFloat(Double.pi), endAngle: 0.0, clockwise: true)
		let circleShape = CAShapeLayer()
		circleShape.path = circlePath.cgPath
		button.layer.mask = circleShape
	}
	
	@objc func pressedComputer() {
		let gameController = ChatGameController()
		gameController.modalPresentationStyle = .fullScreen
		self.navigationController?.navigationBar.isHidden = true
		self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
		self.navigationController?.pushViewController(gameController, animated: true)
	}
	
	func setupPlayerButton() {
		
		let button = UIButton()
		button.backgroundColor = .lightGreen
		button.setTitleColor(.blazingBlack, for: .normal)
		button.titleLabel?.font = UIFont(name: "MyMessyHandwriting", size: 32)
		button.setTitle("VS JOGADOR", for: .normal)
		button.addTarget(self, action: #selector(self.pressedPlayer), for: .touchUpInside)
		self.view.addSubview(button)
		
		button.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			button.widthAnchor.constraint(equalToConstant: 300),
			button.heightAnchor.constraint(equalToConstant: 150),
			button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 60),
			button.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: 5)
		])
		
		button.transform = button.transform.rotated(by: 150)
		
		let circlePath = UIBezierPath.init(arcCenter: CGPoint(x: 150, y: 0), radius: 150, startAngle: 0.0, endAngle: CGFloat(Double.pi), clockwise: true)
		let circleShape = CAShapeLayer()
		circleShape.path = circlePath.cgPath
		button.layer.mask = circleShape
	}
	
	@objc func pressedPlayer() {
		self.view.backgroundColor = .systemGreen
	}

}
