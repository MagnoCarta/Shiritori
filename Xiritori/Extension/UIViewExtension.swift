//
//  UIVIewExtension.swift
//  Xiritori
//
//  Created by Elias Ferreira on 18/09/20.
//  Copyright © 2020 Academy IFCE. All rights reserved.
//

import UIKit

extension UIView {
    // Receives a variadic list o views and add it to the superview.
    func addSubviews(_ views: UIView...) {
        for view in views {
            addSubview(view)
        }
    }
}
