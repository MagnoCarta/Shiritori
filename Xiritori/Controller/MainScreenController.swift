//
//  MainScreenController.swift
//  Xiritori
//
//  Created by Pedro Henrique Costa on 21/09/20.
//  Copyright © 2020 Academy IFCE. All rights reserved.
//

import UIKit

class MainScreenController: UIViewController {

	let mainView = MainScreenView()
	
    override func viewDidLoad() {
        super.viewDidLoad()
		setupNavigationController()
		self.view = mainView
			
		setupPlayButton()
		setupOptionsButton()
		setupFriendsButton()
    }
	
	func setupNavigationController() {
		navigationItem.hidesBackButton = true
		self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
		self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
		self.navigationController?.navigationBar.shadowImage = UIImage()
		self.navigationController?.navigationBar.isTranslucent = true
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
	
	@objc func pressedPlay() {
		let backButton = UIBarButtonItem()
		backButton.title = "Voltar"
		navigationItem.backBarButtonItem = backButton
		
		let playController = PlayScreenController()
		playController.modalPresentationStyle = .fullScreen
		self.navigationController?.pushViewController(playController, animated: true)
	}
	
	func setupFriendsButton() {
		
		let button = UIButton()
		button.backgroundColor = .orangeChat
		button.addTarget(self, action: #selector(self.pressedFriends), for: .touchUpInside)
		self.view.addSubview(button)
		
		let label = UILabel()
		label.text = "AMIGOS"
		label.textColor = .blazingBlack
		label.font = UIFont(name: "MyMessyHandwriting", size: 32)
		button.addSubview(label)
		
		label.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			label.widthAnchor.constraint(equalToConstant: 150),
			label.heightAnchor.constraint(equalToConstant: 40),
			label.centerXAnchor.constraint(equalTo: button.centerXAnchor, constant: 10),
			label.centerYAnchor.constraint(equalTo: button.centerYAnchor, constant: -2)
		])
		
		label.transform = label.transform.rotated(by: 4.2)
		
		button.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			button.widthAnchor.constraint(equalToConstant: 150),
			button.heightAnchor.constraint(equalToConstant: 150),
			button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 112),
			button.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: -48.5)
		])
		
		button.transform = button.transform.rotated(by: 14.908)
		
		let circlePath = UIBezierPath.init(arcCenter: CGPoint(x: 150, y: 150), radius: 150, startAngle: CGFloat(Double.pi/2), endAngle: 0.0, clockwise: true)
		let circleShape = CAShapeLayer()
		circleShape.path = circlePath.cgPath
		button.layer.mask = circleShape
	}
	
	@objc func pressedFriends() {
		let backButton = UIBarButtonItem()
		backButton.title = "Voltar"
		navigationItem.backBarButtonItem = backButton
		
		let friendsController = FriendsController()
		friendsController.modalPresentationStyle = .fullScreen
		self.navigationController?.pushViewController(friendsController, animated: true)
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
		NSLayoutConstraint.activate([
			label.widthAnchor.constraint(equalToConstant: 150),
			label.heightAnchor.constraint(equalToConstant: 40),
			label.centerXAnchor.constraint(equalTo: button.centerXAnchor, constant: -30),
			label.centerYAnchor.constraint(equalTo: button.centerYAnchor, constant: -2)
		])
		
		label.transform = label.transform.rotated(by: 4)
		
		button.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			button.widthAnchor.constraint(equalToConstant: 150),
			button.heightAnchor.constraint(equalToConstant: 150),
			button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 6.5),
			button.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: 60)
		])
		
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
