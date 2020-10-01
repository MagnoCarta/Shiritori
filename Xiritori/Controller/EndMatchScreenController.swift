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
		mainView.matchResults.delegate = self
		mainView.matchResults.dataSource = self
		setupNavigation()
		
		mainView.matchResults.register(EndMatchCell.self, forCellReuseIdentifier: "MatchCell")
		
		self.view = mainView
		
	}
    
	@objc func pressedConfirm() {
		let mainScreenController = MainScreenController()
		mainScreenController.modalPresentationStyle = .fullScreen
		self.navigationController?.pushViewController(mainScreenController, animated: true)
	}

	func setupNavigation() {
		self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
		self.navigationController?.navigationBar.shadowImage = UIImage()
		self.navigationController?.navigationBar.isTranslucent = true
		
		navigationItem.hidesBackButton = true
		let rightButton = UIBarButtonItem(title: "Fim de papo!", style: .plain, target: self, action: #selector(self.pressedConfirm))
		navigationItem.rightBarButtonItems = [rightButton]
	}
	
}

extension EndMatchScreenController: UITableViewDelegate, UITableViewDataSource {
	
	func numberOfSections(in tableView: UITableView) -> Int {
		return 2
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 1
	}
	
	func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
		return CGFloat(80)
	}
	
	func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
		let headerView = UIView()
		headerView.backgroundColor = UIColor.clear
		return headerView
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		let cell = tableView.dequeueReusableCell(withIdentifier: "MatchCell", for: indexPath) as? EndMatchCell
		cell?.backgroundColor = .backgroundColor
		
		return cell!
	}
}
