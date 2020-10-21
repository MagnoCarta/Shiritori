//
//  PainelGameChatView.swift
//  Xiritori
//
//  Created by Vinicius Mesquita on 07/10/20.
//  Copyright © 2020 Academy IFCE. All rights reserved.
//

import UIKit

class PainelGameChatView: UIView {
    
    let blueLine: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let buttonGiveUp: UIButton = {
        let button = UIButton(type: .roundedRect)
        button.layer.cornerRadius = 15
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "Flag"), for: .normal)
        button.contentMode = .scaleAspectFit
        return button
    }()
    
    let shapeEnemyPoints: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 13
        view.backgroundColor = .orangeChat
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let shapeMyPoints: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 13
        view.backgroundColor = .lightGreen
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let myPointsLabel: UILabel = {
        let label = UILabel()
        label.text = "300"
        label.font = UIFont(name: "MyMessyHandwriting", size: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let enemyPointsLabel: UILabel = {
        let label = UILabel()
        label.text = "300"
        label.font = UIFont(name: "MyMessyHandwriting", size: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let clockView: ClockView = {
        let clock = ClockView()
        clock.translatesAutoresizingMaskIntoConstraints = false
        return clock
    }()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .seriousPurple
        buildViewHierarchy()
        setupConstraints()
    }
    
    func buildViewHierarchy() {
        addSubview(shapeMyPoints)
        addSubview(shapeEnemyPoints)
        addSubview(clockView)
        addSubview(buttonGiveUp)
        shapeMyPoints.addSubview(myPointsLabel)
        shapeEnemyPoints.addSubview(enemyPointsLabel)
        addSubview(blueLine)
    }
    
    func setupConstraints() {
        
        // Clock View
        NSLayoutConstraint.activate([
            clockView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            clockView.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 38)
        ])
        
        // Enemy points shape
        NSLayoutConstraint.activate([
            shapeEnemyPoints.heightAnchor.constraint(equalToConstant: 30),
            shapeEnemyPoints.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15),
            shapeEnemyPoints.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 15),
            shapeEnemyPoints.leadingAnchor.constraint(equalTo: centerXAnchor, constant: 90)
        ])
        
        // My point shape
        NSLayoutConstraint.activate([
            shapeMyPoints.heightAnchor.constraint(equalToConstant: 30),
            shapeMyPoints.bottomAnchor.constraint(equalTo: shapeEnemyPoints.topAnchor, constant: -6),
            shapeMyPoints.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 15),
            shapeMyPoints.leadingAnchor.constraint(equalTo: centerXAnchor, constant: 90)
        ])
        
        // Blue line
        NSLayoutConstraint.activate([
            blueLine.bottomAnchor.constraint(equalTo: bottomAnchor),
            blueLine.leadingAnchor.constraint(equalTo: leadingAnchor),
            blueLine.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
        
        // Give up Button Flag
        NSLayoutConstraint.activate([
            buttonGiveUp.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 25),
            buttonGiveUp.heightAnchor.constraint(equalToConstant: 38),
            buttonGiveUp.widthAnchor.constraint(equalToConstant: 38),
            buttonGiveUp.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20)
        ])
        
        // Label
        NSLayoutConstraint.activate([
            myPointsLabel.centerYAnchor.constraint(equalTo: shapeMyPoints.centerYAnchor),
            myPointsLabel.leadingAnchor.constraint(equalTo: shapeMyPoints.leadingAnchor, constant: 20),
            myPointsLabel.trailingAnchor.constraint(equalTo: shapeMyPoints.trailingAnchor, constant: 20)
        ])
        
        NSLayoutConstraint.activate([
            enemyPointsLabel.centerYAnchor.constraint(equalTo: shapeEnemyPoints.centerYAnchor),
            enemyPointsLabel.leadingAnchor.constraint(equalTo: shapeEnemyPoints.leadingAnchor, constant: 20),
            enemyPointsLabel.trailingAnchor.constraint(equalTo: shapeEnemyPoints.trailingAnchor, constant: 20)
        ])
    }
}
