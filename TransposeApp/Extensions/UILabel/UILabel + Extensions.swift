//
//  UILabel + Extensions.swift
//  TransposeApp
//
//  Created by Janco Erasmus on 2021/03/16.
//  Copyright © 2021 Janco Erasmus. All rights reserved.
//

import UIKit

extension UILabel {
    
    func styleForCapoOn(fretNumber: Int) {
        self.font = UIFont.systemFont(ofSize: 28.0, weight: .semibold)
        if fretNumber > 0 {
            let suffix = String(fretNumber).suffix
            self.text = "Place capo on \(fretNumber)\(suffix) fret"
        } else {
            let suffix = String(fretNumber).suffix
            self.text = "No Capo Needed"
        }
    }
    
    func styleForKeys() {
        self.font = UIFont.systemFont(ofSize: 28.0, weight: .semibold)
        self.text = "Transposed Scales"
    }
}

extension String {
    
    var suffix: String {
        switch Int(self) {
        case 1:
            return "st"
        case 2:
            return "nd"
        case 3:
            return "rd"
        default:
            return "th"
        }
    }
}
