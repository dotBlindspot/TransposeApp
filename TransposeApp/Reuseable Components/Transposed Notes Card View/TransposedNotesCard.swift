//
//  TransposedNotesCard.swift
//  TransposeApp
//
//  Created by Janco Erasmus on 2021/03/11.
//  Copyright © 2021 Janco Erasmus. All rights reserved.
//

import UIKit

class TransposedNotesCard: UIView {

    @IBOutlet weak var contentView: UIView!
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupNib()
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override public func awakeFromNib() {
        super.awakeFromNib()
    }

    private func configureView() {

//        backgroundColor = .clear
//        layer.shadowColor = UIColor.black.cgColor
//        layer.shadowOffset = .zero
//        layer.shadowOpacity = 0.2
//        layer.shadowRadius = 3
        
//        contentView.layer.cornerRadius = cornerRadius
//        contentView.layer.masksToBounds = true
//
//        contentView.translatesAutoresizingMaskIntoConstraints = false
    }
}
