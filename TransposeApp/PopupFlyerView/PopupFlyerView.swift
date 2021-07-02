//
//  PopupFlyerView.swift
//  TransposeApp
//
//  Created by Janco Erasmus on 2021/06/30.
//  Copyright © 2021 Janco Erasmus. All rights reserved.
//

import UIKit

public protocol PopupFlyerViewDelegate {
    func tappedPrimaryButton(view: UIView, sender: Any)
    func tappedSecondaryButton(view: UIView, sender: Any)
}

public class PopupFlyerView: UIView {

    @IBOutlet var contentView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var secondaryButton: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var button: UIButton!
    
    var delegate: PopupFlyerViewDelegate?
    
    var title: String? {
        get {
            return titleLabel.text
        }
        set {
            titleLabel.text = newValue
        }
    }
    
    var image: UIImage? {
        get {
            return imageView.image
        }
        set {
            imageView.image = newValue
        }
    }
    
    var primaryButtonTitle: NSAttributedString? {
        get {
            return button.currentAttributedTitle
        }
        set {
            button.setAttributedTitle(newValue, for: .normal)
        }
    }
    
    var secondaryButtonTitle: NSAttributedString? {
        get {
            return secondaryButton.currentAttributedTitle
        }
        set {
            secondaryButton.setAttributedTitle(newValue, for: .normal)
        }
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        initSubviews()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        initSubviews()
    }

    @IBAction func buttonTapped(_ sender: Any) {
        delegate?.tappedPrimaryButton(view: self, sender: sender)
    }
    
    @IBAction func secondaryButtonTapped(_ sender: Any) {
        delegate?.tappedSecondaryButton(view: self, sender: sender)
    }
    
    private func initSubviews() {
        let nib = UINib(nibName: "PopupFlyerView", bundle: nil)
        nib.instantiate(withOwner: self, options: nil)
        contentView.frame = bounds
        addSubview(contentView)
        configureUI()
    }
    
    private func configureUI() {
        button.makeFlyerPrimaryButton()
        secondaryButton.makeFlyerSecondaryButton()
    }
}
