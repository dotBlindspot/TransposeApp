//
//  customLabelToScale.swift
//  TransposeApp
//
//  Created by Janco Erasmus on 2019/02/12.
//  Copyright © 2019 Janco Erasmus. All rights reserved.
//

import UIKit

class customLabelToScales: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLabel()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupLabel()
    }
    
    func setupLabel() {
        textColor = UIColor.darkBlue
        font = UIFont(name: "Furtura", size: 19)
        font = UIFont.boldSystemFont(ofSize: 19)
        layer.cornerRadius = frame.width/5
        layer.masksToBounds = true
    }
}
