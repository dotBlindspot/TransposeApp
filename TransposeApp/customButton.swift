//
//  customButton.swift
//  TransposeApp
//
//  Created by Janco Erasmus on 2019/02/12.
//  Copyright © 2019 Janco Erasmus. All rights reserved.
//

import UIKit

class customButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupButton()
    }
    
    func setupButton() {
        //setShadow()
        setTitleColor(.white, for: .normal)
        
        //backgroundColor     = UIColor.pBlue
        titleLabel?.font    = UIFont(name: "Furtura", size: frame.height/2)
        titleLabel?.font    = UIFont.boldSystemFont(ofSize: frame.height/2)
        layer.cornerRadius  = frame.height/2
//        layer.borderWidth   = 3.0
//        layer.borderColor   = UIColor.pBlue.cgColor
    }
    
    private func setShadow() {
        layer.shadowColor   = UIColor.black.cgColor
        layer.shadowOffset  = CGSize(width: 2.0, height: 2.0)
        layer.shadowRadius  = 2
        layer.shadowOpacity = 0.5
        clipsToBounds       = true
        layer.masksToBounds = false
    }
    
    func shakeAnimation() {
        let key: String = "position"
        let shake           = CABasicAnimation(keyPath: key)
        shake.duration      = 0.1
        shake.repeatCount   = 2
        shake.autoreverses  = true
        
        let fromPoint = CGPoint(x: center.x - 8, y: center.y)
        let fromValue = NSValue(cgPoint: fromPoint)
        
        let toPoint = CGPoint(x: center.x + 8, y: center.y)
        let toValue = NSValue(cgPoint: toPoint)
        
        shake.fromValue = fromValue
        shake.toValue   = toValue
        
        layer.add(shake, forKey: key)
    }
}


