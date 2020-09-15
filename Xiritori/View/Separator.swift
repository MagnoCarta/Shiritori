//
//  Separator.swift
//  Xiritori
//
//  Created by Elias Ferreira on 15/09/20.
//  Copyright © 2020 Academy IFCE. All rights reserved.
//

import UIKit

class Separator: UIView {
    
    lazy var line: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var labelOr: UILabel = {
        let label = UILabel()
        label.text = "OU"
        label.backgroundColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        self.addSubview(line)
        self.addSubview(labelOr)
        
        // Label
        NSLayoutConstraint.activate([
            labelOr.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            labelOr.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            labelOr.widthAnchor.constraint(equalToConstant: 40)
        ])
        // Line
        NSLayoutConstraint.activate([
            line.centerYAnchor.constraint(equalTo: labelOr.centerYAnchor),
            line.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0),
            line.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0),
            line.heightAnchor.constraint(equalToConstant: 1.0)
        ])
    }
    
}
