//
//  UIButton + Extensions.swift
//  TransposeApp
//
//  Created by Janco Erasmus on 2021/03/15.
//  Copyright © 2021 Janco Erasmus. All rights reserved.
//

import UIKit

extension UIButton {
    
    func makePrimaryButton() {
        self.addCardFeel(backgroundColor: .taBlack,
                         shadowIntensity: .low,
                         cornerRadius: .pill)
        self.setTitleColor(.taWhite, for: .normal)
    }
    
    func makeFlyerPrimaryButton() {
        self.setTitleColor(.taWhite, for: .normal)
        self.backgroundColor = UIColor.taBlack
        self.addShadow(intensity: .ultraThin)
        self.layer.cornerRadius = 8
    }
    
    func makeFlyerSecondaryButton() {
        let buttonColor = UIColor.taOlive
        self.setTitleColor(buttonColor, for: .normal)
        self.backgroundColor = .clear
        self.layer.cornerRadius = 8
        self.layer.borderWidth = 2
        self.layer.borderColor = buttonColor.cgColor
        //self.addShadow(intensity: .ultraThin)
    }
}
