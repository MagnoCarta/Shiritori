//
//  Separator.swift
//  Xiritori
//
//  Created by Elias Ferreira on 15/09/20.
//  Copyright © 2020 Academy IFCE. All rights reserved.
//

import UIKit

class Separator: UIView {
    // Views
    lazy var lineL: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var lineR: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var labelOr: UILabel = {
        let label = UILabel()
        label.text = "OU"
        label.backgroundColor = .clear
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // Inits
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Constraints
    private func setupLayout() {
        self.addSubview(lineL)
        self.addSubview(labelOr)
        self.addSubview(lineR)
        
        // Label
        NSLayoutConstraint.activate([
            labelOr.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            labelOr.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            labelOr.widthAnchor.constraint(equalToConstant: 40)
        ])
        // LineL
        NSLayoutConstraint.activate([
            lineL.centerYAnchor.constraint(equalTo: labelOr.centerYAnchor),
            lineL.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0),
            lineL.rightAnchor.constraint(equalTo: labelOr.leftAnchor, constant: 0),
            lineL.heightAnchor.constraint(equalToConstant: 1.0)
        ])
        // LineR
        NSLayoutConstraint.activate([
            lineR.centerYAnchor.constraint(equalTo: labelOr.centerYAnchor),
            lineR.leftAnchor.constraint(equalTo: labelOr.rightAnchor, constant: 0),
            lineR.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0),
            lineR.heightAnchor.constraint(equalToConstant: 1.0)
        ])
    }
    
}
