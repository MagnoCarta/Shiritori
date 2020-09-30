//
//  MainScreenView.swift
//  Xiritori
//
//  Created by Pedro Henrique Costa on 22/09/20.
//  Copyright © 2020 Academy IFCE. All rights reserved.
//

import UIKit

class MainScreenView: UIView {
	
	let centerControl: (x: CGFloat, y: CGFloat) = (x: -5, y: 155)
	let titleImage = UIImageView(image: UIImage(named: "Title"))
	
	let playButton = UIButton()
	let compRosto = UIImageView(image: UIImage(named: "Comp Cabeca"))
	let compBraco = UIImageView(image: UIImage(named: "Comp Bracos"))
	let compFinal = UIImageView(image: UIImage(named: "Comp"))
	let faceRight = UIImageView(image: UIImage(named: "Cara 1"))
	let faceLeft = UIImageView(image: UIImage(named: "Cara 2 Sorrindo"))
	let decorLeft = UIImageView(image: UIImage(named: "Confetin"))
	let decorRight = UIImageView(image: UIImage(named: "Balao"))
	
	let friendsButton = UIButton()
	let dog = UIImageView(image: UIImage(named: "dog"))
	let cat = UIImageView(image: UIImage(named: "Asset 16"))
	let chicken = UIImageView(image: UIImage(named: "Asset 17"))
	
	let optionsButton = UIButton()
	let cog = UIImageView(image: UIImage(named: "Eng"))
	let cogBraco = UIImageView(image: UIImage(named: "Eng Braco"))
	
    override init(frame: CGRect) {
        super.init(frame: frame)
		self.backgroundColor = .seriousPurple
		
		setupBackgroundImage()
		setupOptionsAssets()
		setupFriendsAssets()
		setupPlayAssets()
		
		setupPlayButton()
		setupFriendsButton()
		setupOptionsButton()
		
		setupTitleImage()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
	}
	
	// MARK: - Setup Assets
	func setupTitleImage() {
		
		self.addSubview(titleImage)
		titleImage.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			titleImage.widthAnchor.constraint(equalToConstant: 375),
			titleImage.heightAnchor.constraint(equalToConstant: 190),
			titleImage.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0),
			titleImage.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -225)
		])
		
		let previousTitleTransform = titleImage.transform
		UIView.animate(
			withDuration: 1,
			delay: 0,
			options: [.repeat, .autoreverse],
			animations: {
				self.titleImage.transform = self.titleImage.transform.scaledBy(x: 1.02, y: 1.02)
			},
			completion: { _
				in()
				self.titleImage.transform = previousTitleTransform
			})
	}
	
	func setupPlayAssets() {
		
		self.addSubview(faceLeft)
		faceLeft.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			faceLeft.widthAnchor.constraint(equalToConstant: 85),
			faceLeft.heightAnchor.constraint(equalToConstant: 85),
			faceLeft.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: -115 + centerControl.x),
			faceLeft.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0 + centerControl.y)
		])
		
		self.addSubview(faceRight)
		faceRight.translatesAutoresizingMaskIntoConstraints = false
		faceRight.transform = faceRight.transform.rotated(by: -0.15)
		NSLayoutConstraint.activate([
			faceRight.widthAnchor.constraint(equalToConstant: 90),
			faceRight.heightAnchor.constraint(equalToConstant: 90),
			faceRight.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 70 + centerControl.x),
			faceRight.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -185 + centerControl.y)
		])
		
		self.addSubview(decorRight)
		decorRight.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			decorRight.widthAnchor.constraint(equalToConstant: 90),
			decorRight.heightAnchor.constraint(equalToConstant: 90),
			decorRight.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 45 + centerControl.x),
			decorRight.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -155 + centerControl.y)
		])
		
		self.addSubview(decorLeft)
		decorLeft.translatesAutoresizingMaskIntoConstraints = false
		decorLeft.transform = decorLeft.transform.rotated(by: -0.5)
		NSLayoutConstraint.activate([
			decorLeft.widthAnchor.constraint(equalToConstant: 80),
			decorLeft.heightAnchor.constraint(equalToConstant: 80),
			decorLeft.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: -105 + centerControl.x),
			decorLeft.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -95 + centerControl.y)
		])
		
		self.addSubview(compFinal)
		compFinal.translatesAutoresizingMaskIntoConstraints = false
		compFinal.transform = compFinal.transform.rotated(by: -0.17)
		NSLayoutConstraint.activate([
			compFinal.widthAnchor.constraint(equalToConstant: 150),
			compFinal.heightAnchor.constraint(equalToConstant: 150),
			compFinal.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: -80 + centerControl.x),
			compFinal.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -160 + centerControl.y)
		])
	}
	
	func setupFriendsAssets() {
		
		self.addSubview(dog)
		dog.translatesAutoresizingMaskIntoConstraints = false
		dog.transform = dog.transform.rotated(by: -0.09)
		NSLayoutConstraint.activate([
			dog.widthAnchor.constraint(equalToConstant: 100),
			dog.heightAnchor.constraint(equalToConstant: 100),
			dog.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 128 + centerControl.x),
			dog.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -110 + centerControl.y)
		])
		
		self.addSubview(chicken)
		chicken.translatesAutoresizingMaskIntoConstraints = false
		chicken.transform = chicken.transform.rotated(by: -0.25)
		NSLayoutConstraint.activate([
			chicken.widthAnchor.constraint(equalToConstant: 100),
			chicken.heightAnchor.constraint(equalToConstant: 100),
			chicken.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 142 + centerControl.x),
			chicken.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -55 + centerControl.y)
		])
		
		self.addSubview(cat)
		cat.translatesAutoresizingMaskIntoConstraints = false
		cat.transform = cat.transform.rotated(by: -0.4)
		NSLayoutConstraint.activate([
			cat.widthAnchor.constraint(equalToConstant: 100),
			cat.heightAnchor.constraint(equalToConstant: 100),
			cat.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 135 + centerControl.x),
			cat.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 15 + centerControl.y)
		])
	}
	
	func setupOptionsAssets() {
		
		self.addSubview(cog)
		cog.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			cog.widthAnchor.constraint(equalToConstant: 130),
			cog.heightAnchor.constraint(equalToConstant: 130),
			cog.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 15 + centerControl.x),
			cog.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 100 + centerControl.y)
		])
		
		self.addSubview(cogBraco)
		cogBraco.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			cogBraco.widthAnchor.constraint(equalToConstant: 130),
			cogBraco.heightAnchor.constraint(equalToConstant: 130),
			cogBraco.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: -50 + centerControl.x),
			cogBraco.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 60 + centerControl.y)
		])
	}

	// MARK: - Setup Buttons
	func setupPlayButton() {

		playButton.backgroundColor = .lightGreen
		playButton.setTitleColor(.blazingBlack, for: .normal)
		playButton.titleLabel?.font = UIFont(name: "MyMessyHandwriting", size: 64)
		playButton.setTitle("JOGAR", for: .normal)
		self.addSubview(playButton)
		
		playButton.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			playButton.widthAnchor.constraint(equalToConstant: 300),
			playButton.heightAnchor.constraint(equalToConstant: 150),
			playButton.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: -50 + centerControl.x),
			playButton.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -100 + centerControl.y)
		])
		
		playButton.transform = playButton.transform.rotated(by: 150)
		
		let circlePath = UIBezierPath.init(arcCenter: CGPoint(x: 150, y: 150), radius: 150, startAngle: CGFloat(Double.pi), endAngle: 0.0, clockwise: true)
		let circleShape = CAShapeLayer()
		circleShape.path = circlePath.cgPath
		playButton.layer.mask = circleShape
	}
	
	func setupFriendsButton() {
		
		friendsButton.backgroundColor = .orangeChat
		self.addSubview(friendsButton)
		
		let label = UILabel()
		label.text = "AMIGOS"
		label.textColor = .blazingBlack
		label.font = UIFont(name: "MyMessyHandwriting", size: 32)
		friendsButton.addSubview(label)
		
		label.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			label.widthAnchor.constraint(equalToConstant: 150),
			label.heightAnchor.constraint(equalToConstant: 40),
			label.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 120 + centerControl.x),
			label.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -50 + centerControl.y)
		])
		
		label.transform = label.transform.rotated(by: 4.2)
		
		friendsButton.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			friendsButton.widthAnchor.constraint(equalToConstant: 150),
			friendsButton.heightAnchor.constraint(equalToConstant: 150),
			friendsButton.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 112 + centerControl.x),
			friendsButton.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -48.5 + centerControl.y)
		])
		
		friendsButton.transform = friendsButton.transform.rotated(by: 14.908)
		
		let circlePath = UIBezierPath.init(arcCenter: CGPoint(x: 150, y: 150), radius: 150, startAngle: CGFloat(Double.pi/2), endAngle: 0.0, clockwise: true)
		let circleShape = CAShapeLayer()
		circleShape.path = circlePath.cgPath
		friendsButton.layer.mask = circleShape
	}
	
	func setupOptionsButton() {
	
		optionsButton.backgroundColor = .lightRed
		self.addSubview(optionsButton)
		
		let label = UILabel()
		label.text = "OPÇÖES"
		label.textColor = .blazingBlack
		label.font = UIFont(name: "MyMessyHandwriting", size: 32)
		optionsButton.addSubview(label)
		
		label.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			label.widthAnchor.constraint(equalToConstant: 150),
			label.heightAnchor.constraint(equalToConstant: 40),
			label.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: -15 + centerControl.x),
			label.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 55 + centerControl.y)
		])
		
		label.transform = label.transform.rotated(by: 4)
		
		optionsButton.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			optionsButton.widthAnchor.constraint(equalToConstant: 150),
			optionsButton.heightAnchor.constraint(equalToConstant: 150),
			optionsButton.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 6.5 + centerControl.x),
			optionsButton.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 60 + centerControl.y)
		])
		
		optionsButton.transform = optionsButton.transform.rotated(by: 14.908)
		
		let circlePath = UIBezierPath.init(arcCenter: CGPoint(x: 0, y: 150), radius: 150, startAngle: CGFloat(Double.pi/2), endAngle: 0.0, clockwise: true)
		let circleShape = CAShapeLayer()
		circleShape.path = circlePath.cgPath
		optionsButton.layer.mask = circleShape
	}
}
