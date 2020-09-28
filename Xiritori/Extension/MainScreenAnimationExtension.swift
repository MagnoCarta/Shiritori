//
//  MainScreenAnimationExtension.swift
//  Xiritori
//
//  Created by Pedro Henrique Costa on 28/09/20.
//  Copyright © 2020 Academy IFCE. All rights reserved.
//

import UIKit

extension MainScreenView {
	
	func playButtonAnimation() {
		
		self.faceLeft.transform = self.faceLeft.transform.scaledBy(x: 0.8, y: 0.8)
		UIView.animate(
			withDuration: 0.2,
			animations: {
				self.faceLeft.transform = self.faceLeft.transform.scaledBy(x: 1.5, y: 1.5)
				self.faceLeft.center.x -= 30
			},
			completion: { _
				in()
				self.faceLeft.transform = CGAffineTransform.identity
		})
		
		self.faceRight.transform = self.faceRight.transform.scaledBy(x: 0.8, y: 0.8)
		UIView.animate(
			withDuration: 0.2,
			animations: {
				self.faceRight.transform = self.faceRight.transform.scaledBy(x: 1.5, y: 1.5)
				self.faceRight.center.x += 10
				self.faceRight.center.y -= 10
			},
			completion: { _
				in()
				self.faceRight.transform = CGAffineTransform.identity
		})
		
		self.decorRight.transform = self.decorRight.transform.scaledBy(x: 0.8, y: 0.8)
		UIView.animate(
			withDuration: 0.2,
			animations: {
				self.decorRight.transform = self.decorRight.transform.scaledBy(x: 1.5, y: 1.5)
				self.decorRight.center.y -= 60
			},
			completion: { _
				in()
				self.decorRight.transform = CGAffineTransform.identity
		})
		
		self.decorLeft.transform = self.decorLeft.transform.scaledBy(x: 0.8, y: 0.8)
		UIView.animate(
			withDuration: 0.2,
			animations: {
				self.decorLeft.transform = self.decorLeft.transform.scaledBy(x: 1.5, y: 1.5)
				self.decorLeft.center.x -= 50
			},
			completion: { _
				in()
				self.decorLeft.transform = CGAffineTransform.identity
		})
		
		let previousCompTransform = compFinal.transform
		self.compFinal.transform = self.compFinal.transform.scaledBy(x: 0.8, y: 0.8)
		UIView.animate(
			withDuration: 0.2,
			animations: {
				self.compFinal.transform = self.compFinal.transform.scaledBy(x: 1.5, y: 1.5)
				self.compFinal.center.x -= 20
				self.compFinal.center.y -= 40
			},
			completion: { _
				in()
				self.compFinal.transform = previousCompTransform
		})
	}
	
	func friendsButtonAnimation() {
		
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
	
	func optionsButtonAnimation() {
		
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
