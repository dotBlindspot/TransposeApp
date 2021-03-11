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
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = .zero//CGSize(width: 0.5, height: 0.5)
        self.layer.shadowRadius = 5
        self.layer.shadowOpacity = 1
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
