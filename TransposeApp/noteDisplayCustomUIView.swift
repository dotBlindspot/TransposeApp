//
//  noteDisplayCustomUIView.swift
//  TransposeApp
//
//  Created by Janco Erasmus on 2019/02/12.
//  Copyright © 2019 Janco Erasmus. All rights reserved.
//

import UIKit

class noteDisplayCustomUIView: UIView{
    
    let contanerView = UIView()
    let cornerRadius: CGFloat = 15
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    func setupView(){
        layer.cornerRadius    = frame.height/10
        layer.masksToBounds   = true
        layer.shadowColor     = UIColor.black.cgColor
        layer.shadowOffset    = CGSize(width: 0, height: 1)
        layer.shadowOpacity   = 0.2
        layer.shadowRadius    = 4
    }
}
