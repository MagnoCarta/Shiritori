//
//  FriendsTableViewCell.swift
//  Xiritori
//
//  Created by Elias Ferreira on 18/09/20.
//  Copyright © 2020 Academy IFCE. All rights reserved.
//

import UIKit

class FriendsTableViewCell: UITableViewCell {
    lazy var imageViewCell: UIImageView = {
        let image = UIImageView(image: UIImage(named: "bart"))
        image.contentMode = .scaleAspectFit
        image.layer.cornerRadius = 30
        image.clipsToBounds = true
        return image
        
    }()
    
    lazy var labelName: UILabel = {
        let label = UILabel()
        label.text = "Amigo1#93493"
        return label
    }()
    
    lazy var buttonRemove: UIButton = {
        let button = UIButton()
        button.setTitle("Remover", for: .normal)
        button.backgroundColor = .gray
        button.layer.cornerRadius = 15
        button.setTitleColor(.black, for: .normal)
        //button.addTarget(self, action: #selector(test), for: .touchDown)
        return button
    }()
    
    lazy var buttonVS: UIButton = {
        let button = UIButton()
        button.setTitle("VS", for: .normal)
        button.backgroundColor = .gray
        button.layer.cornerRadius = 15
        button.setTitleColor(.black, for: .normal)
        //button.addTarget(self, action: #selector(test), for: .touchDown)
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .white
        
        self.contentView.addSubview(imageViewCell)
        self.contentView.addSubview(labelName)
        self.contentView.addSubview(buttonRemove)
        self.contentView.addSubview(buttonVS)
        
        self.setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
    }
    
    func setupLayout() {
        imageViewCell.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageViewCell.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            imageViewCell.widthAnchor.constraint(equalToConstant: 60),
            imageViewCell.heightAnchor.constraint(equalToConstant: 60),
            imageViewCell.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 17.5)
        ])
        
        labelName.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            labelName.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 17.5),
            labelName.leftAnchor.constraint(equalTo: imageViewCell.rightAnchor, constant: 17.5)
        ])
        
        buttonRemove.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            buttonRemove.topAnchor.constraint(equalTo: labelName.bottomAnchor, constant: 8),
            buttonRemove.leftAnchor.constraint(equalTo: imageViewCell.rightAnchor, constant: 17.5),
            buttonRemove.heightAnchor.constraint(equalToConstant: 30),
            buttonRemove.widthAnchor.constraint(equalToConstant: 100)
        ])
        
        buttonVS.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            buttonVS.heightAnchor.constraint(equalToConstant: 60),
            buttonVS.widthAnchor.constraint(equalToConstant: 75),
            buttonVS.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -17.5),
            buttonVS.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }

}