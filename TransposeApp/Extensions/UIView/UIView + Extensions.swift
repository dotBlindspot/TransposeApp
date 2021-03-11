//
//  UIView + Extensions.swift
//  TransposeApp
//
//  Created by Janco Erasmus on 2021/03/10.
//  Copyright © 2021 Janco Erasmus. All rights reserved.
//

import UIKit

extension UIView {
    
    func addShadow() {
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowRadius = 10
        self.layer.shadowOpacity = 0.8
    }
}
