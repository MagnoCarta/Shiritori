//
//  EndMatchCell.swift
//  Xiritori
//
//  Created by Pedro Henrique Costa on 24/09/20.
//  Copyright © 2020 Academy IFCE. All rights reserved.
//

import UIKit

class EndMatchCell: UITableViewCell {
	
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
		label.font = UIFont(name: "Comfortaa", size: 18)
		return label
	}()
	
	lazy var scoreView: UIButton = {
		let score = UIButton()
		score.setTitle("999", for: .normal)
		score.titleLabel?.font = UIFont(name: "MyMessyHandwriting", size: 42)
		score.backgroundColor = .lightGreen
		score.layer.cornerRadius = 15
		score.setTitleColor(.blazingBlack, for: .normal)
		return score
	}()
 
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		self.backgroundColor = .white

		self.contentView.addSubview(imageViewCell)
		self.contentView.addSubview(labelName)
		self.contentView.addSubview(scoreView)

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
			labelName.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 37),
			labelName.leftAnchor.constraint(equalTo: imageViewCell.rightAnchor, constant: 17.5),
			labelName.rightAnchor.constraint(equalTo: scoreView.leftAnchor, constant: -17.5)
		])

		scoreView.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			scoreView.heightAnchor.constraint(equalToConstant: 60),
			scoreView.widthAnchor.constraint(equalToConstant: 125),
			scoreView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -17.5),
			scoreView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
		])
	}

}
