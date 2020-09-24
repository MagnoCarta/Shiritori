//
//  EndMatchScreenController.swift
//  Xiritori
//
//  Created by Pedro Henrique Costa on 23/09/20.
//  Copyright © 2020 Academy IFCE. All rights reserved.
//

import UIKit

class EndMatchScreenController: UIViewController {

	let mainView = EndMatchScreenView()
	
    override func viewDidLoad() {
        super.viewDidLoad()
		self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
		self.navigationController?.navigationBar.shadowImage = UIImage()
		self.navigationController?.navigationBar.isTranslucent = true
		self.view = mainView
		
		navigationItem.hidesBackButton = true
		let rightButton = UIBarButtonItem(title: "Confirmar", style: .plain, target: self, action: #selector(self.pressedConfirm))
		navigationItem.rightBarButtonItems = [rightButton]
		
		navigationItem.title = "Fim da Partida"
		navigationController?.navigationBar.prefersLargeTitles = true
		self.navigationController?.navigationBar.largeTitleTextAttributes = [
					NSAttributedString.Key.font: UIFont(name: "MyMessyHandwriting", size: 40)!,
					NSAttributedString.Key.foregroundColor: UIColor.white
				]
		self.navigationController?.navigationBar.titleTextAttributes = [
			NSAttributedString.Key.font: UIFont(name: "MyMessyHandwriting", size: 20)!,
			NSAttributedString.Key.foregroundColor: UIColor.white
		]
	}
    
	@objc func pressedConfirm() {
		self.navigationController?.popToRootViewController(animated: true)
	}

}
