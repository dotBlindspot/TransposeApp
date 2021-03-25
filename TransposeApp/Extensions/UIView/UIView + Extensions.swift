//
//  UIView + Extensions.swift
//  TransposeApp
//
//  Created by Janco Erasmus on 2021/03/10.
//  Copyright © 2021 Janco Erasmus. All rights reserved.
//

import UIKit

enum CornerSize {
    case none
    case small
    case medium
    case large
    case pill
}

enum ShadowIntensity {
    case ultraThin
    case low
    case mild
    case high
    case puffed
}

extension UIView {
    
    func addShadow() {
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = .zero
        self.layer.shadowOpacity = 0.2
        self.layer.shadowRadius = 2
        self.layer.masksToBounds = false
    }
    
    func addShadow(intensity: ShadowIntensity) {
        var opacity: Float = 0.2
        
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = .zero
        self.layer.shadowRadius = 2
        self.layer.masksToBounds = false
        
        switch intensity {
        case .ultraThin:
            self.layer.shadowRadius = 1
        case .mild:
            opacity = 0.5
        case .high:
            opacity = 0.9
        case .puffed:
            opacity = 0.2
            self.layer.shadowRadius = 6
        default:
            opacity = 0.2
        }
        
        self.layer.shadowOpacity = opacity
    }
    
    func addCorners(size: CornerSize) {
        switch size {
        case .none:
            self.layer.cornerRadius = 0
        case .large:
            self.layer.cornerRadius = 25
        case .medium:
            self.layer.cornerRadius = 15
        case .pill:
            self.layer.cornerRadius = self.layer.frame.height/2
        default:
            self.layer.cornerRadius = 8
        }
        self.layer.masksToBounds = true
    }
    
    func addBackground(_ color: UIColor) {
        let backgroundView = UIView(frame: bounds)
        backgroundView.backgroundColor = color
        backgroundView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        insertSubview(backgroundView, at: 0)
    }
    
    func addCardFeel(backgroundColor: UIColor,
                     shadowIntensity: ShadowIntensity,
                     cornerRadius: CornerSize) {
        self.addShadow(intensity: shadowIntensity)
        self.addBackground(backgroundColor)
        self.subviews[0].addCorners(size: cornerRadius)
    }
}

internal extension UIView {
    func setupNib() {
        guard let nibView = viewFromNibClass() else { return }
        nibView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        self.addSubview(nibView)
        nibView.frame = self.bounds
    }
    
    func viewFromNibClass() -> UIView? {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: self.className, bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }
}

public extension NSObjectProtocol {
    
    var className: String {
        return String(describing: type(of: self))
    }
}

extension UIStackView {

    func removeFully(view: UIView) {
        removeArrangedSubview(view)
        view.removeFromSuperview()
    }

    func removeFullyAllArrangedSubviews() {
        arrangedSubviews.forEach { (view) in
            removeFully(view: view)
        }
    }
}
