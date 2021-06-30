//
//  PintView.swift
//  TransposeApp
//
//  Created by Janco Erasmus on 2021/03/24.
//  Copyright © 2021 Janco Erasmus. All rights reserved.
//

import UIKit

class PintView: UIView {

    @IBOutlet var contentView: UIView!
    @IBOutlet weak var actionView: UIView!
    
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
    
    func initSubviews() {
        let nib = UINib(nibName: "PintButtonView", bundle: nil)
        nib.instantiate(withOwner: self, options: nil)
        contentView.frame = bounds
        addSubview(contentView)
        configureUI()
    }
    
    func configureUI() {
        actionView.addCardFeel(backgroundColor: .taOlive,
                               shadowIntensity: .ultraThin,
                               cornerRadius: .pill)
    }
    
    func styleAsBarPint() {
        self.actionView.subviews[0].backgroundColor = .taDarkGrey
    }
    
    func defaultStyle() {
        self.actionView.subviews[0].backgroundColor = .taOlive
    }
}
