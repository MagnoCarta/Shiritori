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
		
		mainView.playButton.addTarget(self, action: #selector(self.pressedPlay), for: .touchUpInside)
		mainView.friendsButton.addTarget(self, action: #selector(self.pressedFriends), for: .touchUpInside)
		mainView.optionsButton.addTarget(self, action: #selector(self.pressedOptions), for: .touchUpInside)
		self.view = mainView
	}
	
	func setupNavigationController() {
		navigationItem.hidesBackButton = true
		self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
		self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
		self.navigationController?.navigationBar.shadowImage = UIImage()
		self.navigationController?.navigationBar.isTranslucent = true
	}
	
	// MARK: - Setup Button Actions
	@objc func pressedPlay(sender: UIButton) {
		let backButton = UIBarButtonItem()
		backButton.title = "Voltar"
		navigationItem.backBarButtonItem = backButton
		
		let previousButtonShape = sender.transform
		sender.transform = sender.transform.scaledBy(x: CGFloat(0.8), y: CGFloat(0.8))
		UIView.animate(
			withDuration: 0.2,
			delay: 0,
			usingSpringWithDamping: CGFloat(0.3),
			initialSpringVelocity: CGFloat(6.0),
			options: [],
			animations: {
				sender.transform = previousButtonShape
			},
		   completion: { _
				in()
				let playController = PlayScreenController()
				playController.modalPresentationStyle = .fullScreen
				self.navigationController?.pushViewController(playController, animated: true)
			}
		)
	}
	
	@objc func pressedFriends(sender: UIButton) {
		let backButton = UIBarButtonItem()
		backButton.title = "Voltar"
		navigationItem.backBarButtonItem = backButton
		
		let previousButtonShape = sender.transform
		sender.transform = sender.transform.scaledBy(x: CGFloat(0.8), y: CGFloat(0.8))
		self.mainView.friendsButtonAnimation()
		UIView.animate(
			withDuration: 0.2,
			delay: 0,
			usingSpringWithDamping: CGFloat(0.3),
			initialSpringVelocity: CGFloat(6.0),
			options: [],
			animations: {
				sender.transform = previousButtonShape
			},
		   completion: { _
				in()
				let friendsController = FriendsController()
				friendsController.modalPresentationStyle = .fullScreen
				self.navigationController?.pushViewController(friendsController, animated: true)
			}
		)
	}
	
	@objc func pressedOptions(sender: UIButton) {
		let previousButtonShape = sender.transform
		sender.transform = sender.transform.scaledBy(x: CGFloat(0.8), y: CGFloat(0.8))
		self.mainView.optionsButtonAnimation()
		UIView.animate(
			withDuration: 0.2,
			delay: 0,
			usingSpringWithDamping: CGFloat(0.3),
			initialSpringVelocity: CGFloat(6.0),
			options: [],
			animations: {
				sender.transform = previousButtonShape
			},
		   completion: { _
				in()
				let friendsController = FriendsController()
				friendsController.modalPresentationStyle = .fullScreen
				self.navigationController?.pushViewController(friendsController, animated: true)
			}
		)
	}
}
