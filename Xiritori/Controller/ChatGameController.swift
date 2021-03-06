//
//  chatGameController.swift
//  Xiritori
//
//  Created by Gilberto Magno on 9/14/20.
//  Copyright © 2020 Academy IFCE. All rights reserved.
//

import Foundation
import UIKit

class ChatGameController: UIViewController {
    
    let viewChat = ChatGame()

    let buttonGiveUp: UIButton = {
        let button = UIButton(type: .roundedRect)
        //button.backgroundColor = .gray
        button.layer.cornerRadius = 15
        let imageView = UIImageView(image: UIImage(named: "Flag"))
        button.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([imageView.topAnchor.constraint(equalTo: button.topAnchor),
                                     imageView.bottomAnchor.constraint(equalTo: button.bottomAnchor),
                                     imageView.leadingAnchor.constraint(equalTo: button.leadingAnchor),
                                     imageView.trailingAnchor.constraint(equalTo: button.trailingAnchor)])
        
        button.contentMode = .scaleAspectFit
        
        return button
    }()
	
	override func viewDidLoad() {
        
        super.viewDidLoad()
        self.view = viewChat
        buttonGiveUp.addTarget(self, action: #selector(giveUp), for: .touchUpInside)
		self.view.addSubview(buttonGiveUp)
		addConstraintGiveUp()
    }
	
    func addConstraintGiveUp() {
        
        buttonGiveUp.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([buttonGiveUp.bottomAnchor.constraint(equalTo: viewChat.shapeTop.bottomAnchor,constant:  -52),
            buttonGiveUp.heightAnchor.constraint(equalToConstant: 30),
            buttonGiveUp.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 32),
            buttonGiveUp.trailingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 62)
        ])
        
        let title = UILabel()
        title.text = "Desistir"
        title.font = UIFont(name: "Comfortaa", size: 23)
        title.textColor = .white
        self.view.addSubview(title)
        title.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([title.topAnchor.constraint(equalTo: buttonGiveUp.bottomAnchor,constant: 12),title.centerXAnchor.constraint(equalTo: buttonGiveUp.centerXAnchor, constant: 0),
//            title.trailingAnchor.constraint(equalTo: buttonGiveUp.trailingAnchor, constant: 0)
        ])
    }
    
    @objc func giveUp() {
        // print(UserDefaults.standard.string(forKey: "randomWord"))
        let dialogMessage = UIAlertController(title: "Confirme", message: "Tem certeza que quer desistir?", preferredStyle: .alert)
        // Create OK button with action handler
        let okay = UIAlertAction(title: "Sim", style: .default, handler: { (_) -> Void in

			self.navigationController?.navigationBar.isHidden = false
			let endMatchController = EndMatchScreenController()
			endMatchController.modalPresentationStyle = .fullScreen
			self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
			self.navigationController?.pushViewController(endMatchController, animated: true)
        })
		
        // Create Cancel button with action handlder
        let cancel = UIAlertAction(title: "Não", style: .cancel) { (_) -> Void in
            
        }
		
        //Add OK and Cancel button to an Alert object

        dialogMessage.addAction(okay)
        dialogMessage.addAction(cancel)
		
        // Present alert message to user
        self.present(dialogMessage, animated: true, completion: nil)
        
        dialogMessage.setMessage(font: UIFont(name: "Comfortaa", size: 18), color: .black)
        dialogMessage.setTitle(font: UIFont(name: "Comfortaa-Bold", size: 20), color: .black)
    }

}
