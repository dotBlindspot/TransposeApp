//
//  TransposerCardView.swift
//  TransposeApp
//
//  Created by Janco Erasmus on 2021/03/13.
//  Copyright © 2021 Janco Erasmus. All rights reserved.
//

import UIKit

@IBDesignable
class TransposerCardView: UIView {
    
    @IBOutlet weak var contentView: UIView!
    
    @IBInspectable private var contentViewBackgroundColor: UIColor = .taWhite {
        didSet {
            configureUI()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupNib()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.setupNib()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureUI()
    }
    
    private func configureUI() {
        contentView.addCardFeel(backgroundColor: contentViewBackgroundColor,
                                shadowIntensity: .low,
                                cornerRadius: .medium)
    }
}
