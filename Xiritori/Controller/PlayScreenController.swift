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
		
		playView.computerButton.addTarget(self, action: #selector(self.pressedComputer), for: .touchUpInside)
		playView.playerButton.addTarget(self, action: #selector(self.pressedPlayer), for: .touchUpInside)
		
		navigationItem.title = "Modo de Jogo"
		navigationController?.navigationBar.prefersLargeTitles = true
		self.navigationController?.navigationBar.largeTitleTextAttributes = [
			NSAttributedString.Key.font: UIFont(name: "MyMessyHandwriting", size: 40)!,
			NSAttributedString.Key.foregroundColor: UIColor.white
		]
		
		self.view = playView
	}
	
	// MARK: - Setup Button Actions
	@objc func pressedComputer(sender: UIButton) {
		let previousButtonShape = sender.transform
		sender.transform = sender.transform.scaledBy(x: CGFloat(0.8), y: CGFloat(0.8))
		self.playView.computerModeAnimation()
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
				usleep(200000)
				let gameController = ChatGameController()
				gameController.modalPresentationStyle = .fullScreen
				self.navigationController?.navigationBar.isHidden = true
				self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
				self.navigationController?.pushViewController(gameController, animated: true)
			}
		)
	}
	
	@objc func pressedPlayer(sender: UIButton) {
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
			}
		)
	}

}
