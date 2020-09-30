//
//  EndMatchScreenView.swift
//  Xiritori
//
//  Created by Pedro Henrique Costa on 24/09/20.
//  Copyright © 2020 Academy IFCE. All rights reserved.
//

import UIKit

class EndMatchScreenView: UIView {
	
	let screenTitle = UIImageView(image: UIImage(named: "FimDeJogo"))
	let winResult = UIImageView(image: UIImage(named: "Sucesso"))
	let loseResult = UIImageView(image: UIImage(named: "Derrota"))
	
	let matchResults = EndMatchTableView(frame: .zero, style: .plain)
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		self.backgroundColor = .seriousPurple
		
		matchResults.allowsSelection = false
		self.addSubview(matchResults)
		
		setupBackgroundImage()
		setupScreenTitle()
		setupMatchResults()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func setupScreenTitle() {
		
		self.addSubview(screenTitle)
		screenTitle.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			screenTitle.widthAnchor.constraint(equalToConstant: 250),
			screenTitle.heightAnchor.constraint(equalToConstant: 40),
			screenTitle.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0),
			screenTitle.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -275)
		])
		
		if Int.random(in: 0...1) == 1 {
			
			self.addSubview(winResult)
			winResult.translatesAutoresizingMaskIntoConstraints = false
			winResult.transform = winResult.transform.scaledBy(x: 0.01, y: 0.01)
			NSLayoutConstraint.activate([
				winResult.widthAnchor.constraint(equalToConstant: 350),
				winResult.heightAnchor.constraint(equalToConstant: 75),
				winResult.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0),
				winResult.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -200)
			])
			
			UIView.animate(
				withDuration: 1,
				delay: 0.75,
				usingSpringWithDamping: CGFloat(0.3),
				initialSpringVelocity: CGFloat(6.0),
				options: [],
				animations: {
					self.winResult.transform = self.winResult.transform.scaledBy(x: 100, y: 100)
				},
				completion: { _
					in()
				}
			)
		} else {
			
			self.addSubview(loseResult)
			loseResult.translatesAutoresizingMaskIntoConstraints = false
			winResult.transform = winResult.transform.scaledBy(x: 0.01, y: 0.01)
			loseResult.transform = loseResult.transform.scaledBy(x: 0.01, y: 0.01)
			NSLayoutConstraint.activate([
				loseResult.widthAnchor.constraint(equalToConstant: 350),
				loseResult.heightAnchor.constraint(equalToConstant: 75),
				loseResult.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0),
				loseResult.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -200)
			])
			
			UIView.animate(
				withDuration: 1,
				delay: 0.75,
				usingSpringWithDamping: CGFloat(0.3),
				initialSpringVelocity: CGFloat(6.0),
				options: [],
				animations: {
					self.loseResult.transform = self.loseResult.transform.scaledBy(x: 100, y: 100)
				},
				completion: { _
					in()
				}
			)
		}
	}
	
	func setupMatchResults() {
		matchResults.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			matchResults.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 200),
			matchResults.bottomAnchor.constraint(equalTo: self.bottomAnchor),
			matchResults.leadingAnchor.constraint(equalTo: self.leadingAnchor),
			matchResults.trailingAnchor.constraint(equalTo: self.trailingAnchor)
		])
	}
}
