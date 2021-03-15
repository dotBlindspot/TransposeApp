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
}
