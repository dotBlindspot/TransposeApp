//
//  TABaseView.swift
//  TransposeApp
//
//  Created by Janco Erasmus on 2021/03/15.
//  Copyright © 2021 Janco Erasmus. All rights reserved.
//

import UIKit

@IBDesignable
class TABaseView: UIView {
    
    @IBInspectable public var cornerRadius: CGFloat = 0 {
        didSet {
            configureView()
        }
    }

    override public init(frame: CGRect) {
        super.init(frame: frame)
        self.setupView()
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.setupView()
    }
    
    public func setupView() {
        self.setupNib()
        configureView()
    }

    private func configureView() {
        self.layer.cornerRadius = self.cornerRadius
        self.layer.masksToBounds = true
    }
}
