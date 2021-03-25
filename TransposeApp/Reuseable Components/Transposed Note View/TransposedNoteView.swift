//
//  TransposedNoteView.swift
//  TransposeApp
//
//  Created by Janco Erasmus on 2021/03/11.
//  Copyright © 2021 Janco Erasmus. All rights reserved.
//

import UIKit

protocol TransposedNoteViewDelegate {
    func tappedNoteFrom(note: String)
    func tappedNoteTo(note: String)
}

@IBDesignable
class TransposedNoteView: UIView {
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var stackView: UIStackView!
    
    @IBOutlet weak var noteNumberLabel: UILabel!
    @IBOutlet weak var noteFromLabel: UILabel!
    @IBOutlet weak var noteFromButton: UIButton!
    @IBOutlet weak var noteToButton: UIButton!
    @IBOutlet weak var noteToLabel: UILabel!
    
    var delegate: TransposedNoteViewDelegate!
    
    //MARK: - IBInspectables
    
    @IBInspectable private var cornerRadius: CGFloat = 15 {
        didSet {
             configureView()
        }
    }
    
    // MARK: - Setup

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        configureView()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
        configureView()
    }
    
    override public func awakeFromNib() {
        super.awakeFromNib()
        configureView()
    }
    
    // MARK: - Methods
    @IBAction func noteFromButtonTapped(_ sender: Any) {
        delegate.tappedNoteFrom(note: noteFromButton.title(for: .normal)!)
    }
    
    @IBAction func noteToButtonTapped(_ sender: Any) {
        delegate.tappedNoteTo(note: noteToButton.title(for: .normal)!)
    }
    
    func populateNoteView(noteNumber: String, noteFrom: String, noteTo: String) {
        self.isHidden = false
        noteNumberLabel.text = noteNumber
        noteFromButton.setTitle(noteFrom, for: .normal)
        noteToButton.setTitle(noteTo, for: .normal)
    }
    
    func clearLabels() {
        self.isHidden = true
        noteNumberLabel.text = ""
        noteFromButton.setTitle("", for: .normal)
        noteToButton.setTitle("", for: .normal)
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
