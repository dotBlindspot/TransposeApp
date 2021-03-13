//
//  TransposedNoteView.swift
//  TransposeApp
//
//  Created by Janco Erasmus on 2021/03/11.
//  Copyright © 2021 Janco Erasmus. All rights reserved.
//

import UIKit

@IBDesignable
class TransposedNoteView: UIView {
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var stackView: UIStackView!
    
    @IBOutlet weak var noteNumberLabel: UILabel!
    @IBOutlet weak var noteFromLabel: UILabel!
    @IBOutlet weak var noteToLabel: UILabel!
    
    //MARK: - IBInspectables
    
    @IBInspectable private var cornerRadius: CGFloat = 15 {
        didSet {
            // configureView()
        }
    }
    
    // MARK: - Setup

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    override public func awakeFromNib() {
        super.awakeFromNib()
        //configureView()
    }
    
    // MARK: - Methods
    
    func populateNoteView(noteNumber: String, noteFrom: String, noteTo: String) {
        noteNumberLabel.text = noteNumber
        noteFromLabel.text = noteFrom
        noteToLabel.text = noteTo
    }
    
    // MARK: - Private
    
    private func setupView() {
        self.setupNib()
    }
    
    private func configureView() {

        backgroundColor = .clear
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = .zero
        layer.shadowOpacity = 0.2
        layer.shadowRadius = 3
        
        contentView.layer.cornerRadius = cornerRadius
        contentView.layer.masksToBounds = true
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
    }
}
