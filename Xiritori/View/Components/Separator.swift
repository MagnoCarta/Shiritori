//
//  Separator.swift
//  Xiritori
//
//  Created by Elias Ferreira on 15/09/20.
//  Copyright © 2020 Academy IFCE. All rights reserved.
//

import UIKit

class Separator: UIView {

// MARK: - VIEWS
    
    // Line Left
    lazy var lineL: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    // Line Right
    lazy var lineR: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    // Label OR
    lazy var labelOr: UILabel = {
        let label = UILabel()
        label.text = "OU"
        label.textColor = .gray
        label.backgroundColor = .clear
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
// MARK: - INIT
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(lineL)
        self.addSubview(labelOr)
        self.addSubview(lineR)
        self.setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
// MARK: - CONSTRAINTS
    
    private func setupLayout() {
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
            lineL.heightAnchor.constraint(equalToConstant: 2.0)
        ])
        // LineR
        NSLayoutConstraint.activate([
            lineR.centerYAnchor.constraint(equalTo: labelOr.centerYAnchor),
            lineR.leftAnchor.constraint(equalTo: labelOr.rightAnchor, constant: 0),
            lineR.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0),
            lineR.heightAnchor.constraint(equalToConstant: 2.0)
        ])
    }
}
