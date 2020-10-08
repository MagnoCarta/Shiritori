//
//  MessageInputContainer.swift
//  Xiritori
//
//  Created by Vinicius Mesquita on 08/10/20.
//  Copyright © 2020 Academy IFCE. All rights reserved.
//

import UIKit

class MessageInputContainerView: UIView {
    
    let inputMessageTextField: UITextField = {
        var textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.font = UIFont.systemFont(ofSize: 16)
        textField.borderStyle = .roundedRect
        textField.autocorrectionType = .no
        textField.returnKeyType = .done
        textField.clearButtonMode = .whileEditing
        textField.contentVerticalAlignment = .center
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 16
        textField.backgroundColor = .white
        textField.clipsToBounds = true
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    let sendTextButton: UIButton = {
        let button = UIButton(type: .roundedRect)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .lightGreen
        button.layer.cornerRadius = 15
        return button
    }()
    
    let blueLine: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .lightGreen
        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .seriousPurple
        buildViewHierarchy()
        setupConstraints()
    }
    
    func buildViewHierarchy() {
        addSubview(blueLine)
        addSubview(inputMessageTextField)
        addSubview(sendTextButton)
    }
    
    func setupConstraints() {
    
        NSLayoutConstraint.activate([
            blueLine.leadingAnchor.constraint(equalTo: leadingAnchor),
            blueLine.trailingAnchor.constraint(equalTo: trailingAnchor),
            blueLine.topAnchor.constraint(equalTo: topAnchor),
            blueLine.heightAnchor.constraint(equalToConstant: 3)
        ])
        
        NSLayoutConstraint.activate([
            sendTextButton.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            sendTextButton.heightAnchor.constraint(equalToConstant: 35),
            sendTextButton.widthAnchor.constraint(equalToConstant: 40),
            sendTextButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15)
        ])
        
        NSLayoutConstraint.activate([
            inputMessageTextField.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            inputMessageTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            inputMessageTextField.heightAnchor.constraint(equalToConstant: 35),
            inputMessageTextField.trailingAnchor.constraint(equalTo: self.sendTextButton.leadingAnchor, constant: -16)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
