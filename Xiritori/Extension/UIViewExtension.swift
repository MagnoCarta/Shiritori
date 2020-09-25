//
//  UIVIewExtension.swift
//  Xiritori
//
//  Created by Elias Ferreira on 18/09/20.
//  Copyright © 2020 Academy IFCE. All rights reserved.
//

import UIKit

extension UIView {
	// Receives a variadic list o views and add it to the superview.
	func addSubviews(_ views: UIView...) {
		for view in views {
			addSubview(view)
		}
	}
	
	//Uses image asset and sets it as a background image for the current view
	func setupBackgroundImage() {

		let imageView = UIImageView(image: UIImage(named: "Textura"))
		imageView.alpha = CGFloat(0.05)
		imageView.contentMode =  UIView.ContentMode.scaleAspectFill
		imageView.clipsToBounds = true
		imageView.center = self.center
		
		imageView.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			imageView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
			imageView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height)
		])
		
		self.addSubview(imageView)
	}
}
