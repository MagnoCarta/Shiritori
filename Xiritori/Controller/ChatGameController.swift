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
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.view = viewChat

	}
	
}
