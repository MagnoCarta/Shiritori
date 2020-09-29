//
//  PlayScreenView.swift
//  Xiritori
//
//  Created by Pedro Henrique Costa on 22/09/20.
//  Copyright © 2020 Academy IFCE. All rights reserved.
//

import UIKit

class PlayScreenView: UIView {

	let centerControl: (x: CGFloat, y: CGFloat) = (x: 0, y: 125)
	
	let screenTitle = UIImageView(image: UIImage(named: "ModoDeJogo-2-2"))
	
	let computerButton = UIButton()
	let comp = UIImageView(image: UIImage(named: "Comp"))
	let decorCompLeft = UIImageView(image: UIImage(named: "Confetin"))
	let decorCompRight = UIImageView(image: UIImage(named: "Confetin"))
	
	let playerButton = UIButton()
	let faceLeft = UIImageView(image: UIImage(named: "Cara 1"))
	let faceRight = UIImageView(image: UIImage(named: "Cara 2 Sorrindo"))
	let decorBalloon = UIImageView(image: UIImage(named: "Balao"))
	
    override init(frame: CGRect) {
        super.init(frame: frame)
		self.backgroundColor = .seriousPurple
		
		setupBackgroundImage()
		
		setupComputerAssets()
		setupPlayerAssets()
		
		setupComputerButton()
		setupPlayerButton()
		
		setupTitleAssets()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

	// MARK: - Setup Assets
	func setupTitleAssets() {
		
		self.addSubview(screenTitle)
		screenTitle.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			screenTitle.widthAnchor.constraint(equalToConstant: 225),
			screenTitle.heightAnchor.constraint(equalToConstant: 125),
			screenTitle.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0 + centerControl.x),
			screenTitle.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -360 + centerControl.y)
		])
		
		let previousTitleTransform = screenTitle.transform
		UIView.animate(
			withDuration: 1,
			delay: 0,
			options: [.repeat, .autoreverse],
			animations: {
				self.screenTitle.transform = self.screenTitle.transform.scaledBy(x: 1.05, y: 1.05)
			},
			completion: { _
				in()
				self.screenTitle.transform = previousTitleTransform
			})
	}
	
	func setupComputerAssets() {
		
		self.addSubview(decorCompLeft)
		decorCompLeft.translatesAutoresizingMaskIntoConstraints = false
		decorCompLeft.transform = decorCompLeft.transform.rotated(by: -0.65)
		NSLayoutConstraint.activate([
			decorCompLeft.widthAnchor.constraint(equalToConstant: 100),
			decorCompLeft.heightAnchor.constraint(equalToConstant: 100),
			decorCompLeft.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: -110 + centerControl.x),
			decorCompLeft.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -20 + centerControl.y)
		])
		
		self.addSubview(decorCompRight)
		decorCompRight.translatesAutoresizingMaskIntoConstraints = false
		decorCompRight.image = decorCompRight.image?.withHorizontallyFlippedOrientation()
		decorCompRight.transform = decorCompRight.transform.rotated(by: -0.2)
		NSLayoutConstraint.activate([
			decorCompRight.widthAnchor.constraint(equalToConstant: 155),
			decorCompRight.heightAnchor.constraint(equalToConstant: 155),
			decorCompRight.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 55 + centerControl.x),
			decorCompRight.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -130 + centerControl.y)
		])
		
		self.addSubview(comp)
		comp.translatesAutoresizingMaskIntoConstraints = false
		comp.transform = comp.transform.rotated(by: -0.4)
		NSLayoutConstraint.activate([
			comp.widthAnchor.constraint(equalToConstant: 175),
			comp.heightAnchor.constraint(equalToConstant: 175),
			comp.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: -100 + centerControl.x),
			comp.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -135 + centerControl.y)
		])
	}
	
	func setupPlayerAssets() {
		
		self.addSubview(faceRight)
		faceRight.translatesAutoresizingMaskIntoConstraints = false
		faceRight.image = faceRight.image?.withHorizontallyFlippedOrientation()
		NSLayoutConstraint.activate([
			faceRight.widthAnchor.constraint(equalToConstant: 90),
			faceRight.heightAnchor.constraint(equalToConstant: 90),
			faceRight.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 123 + centerControl.x),
			faceRight.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0 + centerControl.y)
		])
		
		self.addSubview(faceLeft)
		faceLeft.translatesAutoresizingMaskIntoConstraints = false
		faceLeft.transform = faceLeft.transform.rotated(by: 2.5)
		NSLayoutConstraint.activate([
			faceLeft.widthAnchor.constraint(equalToConstant: 105),
			faceLeft.heightAnchor.constraint(equalToConstant: 105),
			faceLeft.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0 + centerControl.x),
			faceLeft.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 105 + centerControl.y)
		])
		
		self.addSubview(decorBalloon)
		decorBalloon.translatesAutoresizingMaskIntoConstraints = false
		decorBalloon.transform = decorBalloon.transform.rotated(by: 3)
		NSLayoutConstraint.activate([
			decorBalloon.widthAnchor.constraint(equalToConstant: 110),
			decorBalloon.heightAnchor.constraint(equalToConstant: 110),
			decorBalloon.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 45 + centerControl.x),
			decorBalloon.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 40 + centerControl.y)
		])
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
			computerButton.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: -50 + centerControl.x),
			computerButton.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -100 + centerControl.y)
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
			playerButton.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 60 + centerControl.x),
			playerButton.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 5 + centerControl.y)
		])
		
		playerButton.transform = playerButton.transform.rotated(by: 150)
		
		let circlePath = UIBezierPath.init(arcCenter: CGPoint(x: 150, y: 0), radius: 150, startAngle: 0.0, endAngle: CGFloat(Double.pi), clockwise: true)
		let circleShape = CAShapeLayer()
		circleShape.path = circlePath.cgPath
		playerButton.layer.mask = circleShape
	}
	
	// MARK: - Asset Animation
	func computerModeAnimation() {
		
		let previousDecorLeftTransform = decorCompLeft.transform
		self.decorCompLeft.transform = self.decorCompLeft.transform.scaledBy(x: 0.8, y: 0.8)
		UIView.animate(
			withDuration: 0.2,
			animations: {
				self.decorCompLeft.transform = self.decorCompLeft.transform.scaledBy(x: 1.5, y: 1.5)
				self.decorCompLeft.center.x -= 60
			},
			completion: { _
				in()
				self.decorCompLeft.transform = previousDecorLeftTransform
		})
		
		let previousDecorRightTransform = decorCompRight.transform
		self.decorCompRight.transform = self.decorCompRight.transform.scaledBy(x: 0.8, y: 0.8)
		UIView.animate(
			withDuration: 0.2,
			animations: {
				self.decorCompRight.transform = self.decorCompRight.transform.scaledBy(x: 1.5, y: 1.5)
				self.decorCompRight.center.y -= 80
			},
			completion: { _
				in()
				self.decorCompRight.transform = previousDecorRightTransform
		})
		
		let previousCompTransform = comp.transform
		self.comp.transform = self.comp.transform.scaledBy(x: 0.8, y: 0.8)
		UIView.animate(
			withDuration: 0.2,
			animations: {
				self.comp.transform = self.comp.transform.scaledBy(x: 1.5, y: 1.5)
				self.comp.center.x -= 35
				self.comp.center.y -= 35
			},
			completion: { _
				in()
				self.comp.transform = previousCompTransform
		})
	}
	
	func playerModeAnimation() {
		
		self.faceRight.transform = self.faceRight.transform.scaledBy(x: 0.8, y: 0.8)
		UIView.animate(
			withDuration: 0.2,
			animations: {
				self.faceRight.transform = self.faceRight.transform.scaledBy(x: 1.5, y: 1.5)
				self.faceRight.center.x += 27
			},
			completion: { _
				in()
				self.faceRight.transform = CGAffineTransform.identity
		})
		
		let previousFaceLeftTransform = faceLeft.transform
		self.faceLeft.transform = self.faceLeft.transform.scaledBy(x: 0.8, y: 0.8)
		UIView.animate(
			withDuration: 0.2,
			animations: {
				self.faceLeft.transform = self.faceLeft.transform.scaledBy(x: 1.5, y: 1.5)
				self.faceLeft.center.y += 23
			},
			completion: { _
				in()
				self.faceLeft.transform = previousFaceLeftTransform
		})
		
		let previousBalloonTransform = decorBalloon.transform
		self.decorBalloon.transform = self.decorBalloon.transform.scaledBy(x: 0.8, y: 0.8)
		UIView.animate(
			withDuration: 0.2,
			animations: {
				self.decorBalloon.transform = self.decorBalloon.transform.scaledBy(x: 1.5, y: 1.5)
				self.decorBalloon.center.y += 90
			},
			completion: { _
				in()
				self.decorBalloon.transform = previousBalloonTransform
		})
	}
}
