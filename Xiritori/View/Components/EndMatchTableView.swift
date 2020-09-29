//
//  EndMatchTableView.swift
//  Xiritori
//
//  Created by Pedro Henrique Costa on 24/09/20.
//  Copyright © 2020 Academy IFCE. All rights reserved.
//

import UIKit

class EndMatchTableView: UITableView {

	override init(frame: CGRect, style: UITableView.Style) {
		super.init(frame: frame, style: style)
		self.backgroundColor = .clear
		self.alwaysBounceVertical = false
		self.tableHeaderView = .none
		self.alwaysBounceHorizontal = false
		self.separatorInset = .zero
		self.tableFooterView = UIView()
		self.rowHeight = 95
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
 
}
