//
//  MainScreenView.swift
//  Xiritori
//
//  Created by Pedro Henrique Costa on 22/09/20.
//  Copyright © 2020 Academy IFCE. All rights reserved.
//

import UIKit

class MainScreenView: UIView {
	
	let playButton = UIButton()
	
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
		setupPlayButton()
		setupFriendsButton()
		setupOptionsButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
	}
	
	// MARK: - Setup Assets
	func setupFriendsAssets() {
		
		self.addSubview(dog)
		dog.translatesAutoresizingMaskIntoConstraints = false
		dog.transform = dog.transform.rotated(by: -0.09)
		NSLayoutConstraint.activate([
			dog.widthAnchor.constraint(equalToConstant: 100),
			dog.heightAnchor.constraint(equalToConstant: 100),
			dog.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 128),
			dog.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -110)
		])
		
		self.addSubview(chicken)
		chicken.translatesAutoresizingMaskIntoConstraints = false
		chicken.transform = chicken.transform.rotated(by: -0.25)
		NSLayoutConstraint.activate([
			chicken.widthAnchor.constraint(equalToConstant: 100),
			chicken.heightAnchor.constraint(equalToConstant: 100),
			chicken.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 142),
			chicken.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -55)
		])
		
		self.addSubview(cat)
		cat.translatesAutoresizingMaskIntoConstraints = false
		cat.transform = cat.transform.rotated(by: -0.4)
		NSLayoutConstraint.activate([
			cat.widthAnchor.constraint(equalToConstant: 100),
			cat.heightAnchor.constraint(equalToConstant: 100),
			cat.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 135),
			cat.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 15)
		])
	}
	
	func setupOptionsAssets() {
		
		self.addSubview(cog)
		cog.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			cog.widthAnchor.constraint(equalToConstant: 130),
			cog.heightAnchor.constraint(equalToConstant: 130),
			cog.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 15),
			cog.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 100)
		])
		
		self.addSubview(cogBraco)
		cogBraco.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			cogBraco.widthAnchor.constraint(equalToConstant: 130),
			cogBraco.heightAnchor.constraint(equalToConstant: 130),
			cogBraco.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: -50),
			cogBraco.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 60)
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
			playButton.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: -50),
			playButton.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -100)
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
			label.centerXAnchor.constraint(equalTo: friendsButton.centerXAnchor, constant: 10),
			label.centerYAnchor.constraint(equalTo: friendsButton.centerYAnchor, constant: -2)
		])
		
		label.transform = label.transform.rotated(by: 4.2)
		
		friendsButton.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			friendsButton.widthAnchor.constraint(equalToConstant: 150),
			friendsButton.heightAnchor.constraint(equalToConstant: 150),
			friendsButton.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 112),
			friendsButton.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -48.5)
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
			label.centerXAnchor.constraint(equalTo: optionsButton.centerXAnchor, constant: -30),
			label.centerYAnchor.constraint(equalTo: optionsButton.centerYAnchor, constant: -2)
		])
		
		label.transform = label.transform.rotated(by: 4)
		
		optionsButton.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			optionsButton.widthAnchor.constraint(equalToConstant: 150),
			optionsButton.heightAnchor.constraint(equalToConstant: 150),
			optionsButton.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 6.5),
			optionsButton.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 60)
		])
		
		optionsButton.transform = optionsButton.transform.rotated(by: 14.908)
		
		let circlePath = UIBezierPath.init(arcCenter: CGPoint(x: 0, y: 150), radius: 150, startAngle: CGFloat(Double.pi/2), endAngle: 0.0, clockwise: true)
		let circleShape = CAShapeLayer()
		circleShape.path = circlePath.cgPath
		optionsButton.layer.mask = circleShape
	}
	
	// MARK: - Asset Animation
	func friendsAnimation() {
		
		self.dog.transform = self.dog.transform.scaledBy(x: 0.8, y: 0.8)
		UIView.animate(
			withDuration: 0.2,
			animations: {
				self.dog.transform = self.dog.transform.scaledBy(x: 1.5, y: 1.5)
				self.dog.center.x += 25
				self.dog.center.y -= 10
			},
			completion: { _
				in()
				self.dog.transform = CGAffineTransform.identity
			})
		
		let previousChickenTransform = self.chicken.transform
		self.chicken.transform = self.chicken.transform.scaledBy(x: 0.8, y: 0.8)
		UIView.animate(
			withDuration: 0.2,
			animations: {
				self.chicken.transform = self.chicken.transform.scaledBy(x: 1.5, y: 1.5)
				self.chicken.center.x += 30
			},
			completion: { _
				in()
				self.chicken.transform = previousChickenTransform
			})
		
		let previousCatTransform = self.cat.transform
		self.cat.transform = self.cat.transform.scaledBy(x: 0.8, y: 0.8)
		UIView.animate(
			withDuration: 0.2,
			animations: {
				self.cat.transform = self.cat.transform.scaledBy(x: 1.5, y: 1.5)
				self.cat.center.x += 23
				self.cat.center.y += 3
			},
			completion: { _
				in()
				self.cat.transform = previousCatTransform
			})
	}
	
	func optionsAnimation() {
		
		self.cog.transform = self.cog.transform.scaledBy(x: 0.8, y: 0.8)
		UIView.animate(
			withDuration: 0.2,
			animations: {
				self.cog.transform = self.cog.transform.scaledBy(x: 1.5, y: 1.5)
				self.cog.center.y += 35
			},
			completion: { _
				in()
				self.cog.transform = CGAffineTransform.identity
			})
		
		self.cogBraco.transform = self.cogBraco.transform.scaledBy(x: 0.8, y: 0.8)
		UIView.animate(
			withDuration: 0.2,
			animations: {
				self.cogBraco.transform = self.cogBraco.transform.scaledBy(x: 1.5, y: 1.5)
				self.cogBraco.center.x -= 10
				self.cogBraco.center.y += 35
			},
			completion: { _
				in()
				self.cogBraco.transform = CGAffineTransform.identity
			})
	}
	
}
