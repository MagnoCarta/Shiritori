//
//  ClockView.swift
//  Xiritori
//
//  Created by Vinicius Mesquita on 08/10/20.
//  Copyright © 2020 Academy IFCE. All rights reserved.
//

import UIKit

class ClockView: UIView {
    
    var path: UIBezierPath! // ???
    
    var radius: Int = 35
    var inversalTime: CGFloat = 0.0
    
    let shapeBackLine: CAShapeLayer = {
        let layer = CAShapeLayer()
        layer.fillColor = UIColor.lightRed.cgColor
        return layer
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        // clockTime()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func clockTime() {
        
        var tempo: Double = 0 // ???
        
        // One Layer.
        let circle = UIBezierPath(arcCenter: .zero,
                                  radius: 35,
                                  startAngle: .zero,
                                  endAngle: 2*(.pi),
                                  clockwise: true)
        
        shapeBackLine.path = circle.cgPath
        self.layer.addSublayer(shapeBackLine) // add layer
        
        // Timer Logic
        Timer.scheduledTimer(withTimeInterval: 0.02, repeats: true) { _ in
            tempo += 0.01
            self.inversalTime += 0.01
            
            let pathHalfLeftCircle = self.create(startAngle: 3*(.pi)/2, endAngle: self.inversalTime).cgPath
            
            let pathHalfRightCircle = self.create(startAngle: .pi/2, endAngle: self.inversalTime + .pi).cgPath
            
            // Another layer
            let circleShape = CAShapeLayer()
            circleShape.path = pathHalfLeftCircle
            circleShape.fillColor = UIColor.seriousPurple.cgColor
            self.layer.addSublayer(circleShape)
            
            // Another layer
            let otherSideCircleshape = CAShapeLayer()
            otherSideCircleshape.path = pathHalfRightCircle
            otherSideCircleshape.fillColor = UIColor.seriousPurple.cgColor
            self.layer.addSublayer(otherSideCircleshape)
            
            var tempoEspera: Double = 0 // /????
            
            // Timer logic
            Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { etimer in
                tempoEspera += 0.01
                if tempoEspera > 0.02 {
                    circleShape.removeFromSuperlayer()
                    etimer.invalidate()
                }
                
            }
            
            // ????
            if self.inversalTime >= (2*(.pi))+(3*(.pi)/2) {
                self.inversalTime = 3*(.pi)/2
            }
        }
        
    }
    
    func create(radius: CGFloat = 35, startAngle: CGFloat, endAngle: CGFloat) -> UIBezierPath {
        UIBezierPath(arcCenter: .zero, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: true)
    }

}
