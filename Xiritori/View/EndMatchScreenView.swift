//
//  EndMatchScreenView.swift
//  Xiritori
//
//  Created by Pedro Henrique Costa on 24/09/20.
//  Copyright © 2020 Academy IFCE. All rights reserved.
//

import UIKit

class EndMatchScreenView: UIView {

	let matchResults = EndMatchTableView(frame: .zero, style: .plain)
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		self.backgroundColor = .seriousPurple
		
		matchResults.allowsSelection = false
		self.addSubview(matchResults)
		
		setupBackgroundImage()
		setupMatchResults()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
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
