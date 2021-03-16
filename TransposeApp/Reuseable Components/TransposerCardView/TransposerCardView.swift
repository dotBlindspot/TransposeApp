//
//  TransposerCardView.swift
//  TransposeApp
//
//  Created by Janco Erasmus on 2021/03/13.
//  Copyright © 2021 Janco Erasmus. All rights reserved.
//

import UIKit

@IBDesignable
class TransposerCardView: UIView, NoteBankable {
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var subContentView: UIView!
    @IBOutlet private var titleLabel: UILabel!
    @IBOutlet weak var noteLabel: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    
    var delegate: TransposerCardViewDelegate?
    
    @IBInspectable public var contentViewBackgroundColor: UIColor = .taBlack {
        didSet {
            configureUI()
        }
    }
    
    @IBInspectable public var subContentViewBackgroundColor: UIColor = .taWhite {
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
    
    @IBAction func stepperViewTapped(_ sender: Any) {
        noteLabel.text = selectedNoteString
        delegate?.didChangeNoteValue()
    }
    
    private func configureUI() {
        contentView.addCardFeel(backgroundColor: contentViewBackgroundColor,
                                shadowIntensity: .low,
                                cornerRadius: .medium)
        subContentView.addCardFeel(backgroundColor: subContentViewBackgroundColor,
                                   shadowIntensity: .low,
                                   cornerRadius: .medium)
        noteLabel.text = noteBank[0]
    }
    
    // MARK: - Getters
    
    var selectedNoteString: String {
        return noteBank[Int(stepper.value)]
    }
    
    var selectedNoteIndex: Int {
        return Int(stepper.value)
    }
    
    // MARK: - Setters
    
    var titleLabelText: String {
        get {
            return titleLabel.text!
        }
        set {
            titleLabel.text = newValue
        }
    }
}
