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
    @IBOutlet private var titleLabel: UILabel!
    @IBOutlet weak var noteTextField: UITextField!
    
    private var keyNotePickerView = UIPickerView()
    private var keyNotePickerViewItems = ArraySlice<String>()
    private var toolBar = UIToolbar()
    private var noteTitleType: NoteTitle?
        
    var delegate: TransposerCardViewDelegate?
    var selectedNoteIndex: Int?
    
    var pickerTitle: String {
        switch noteTitleType {
        case .keyNoteFrom:
            return "Choose key to transpose from"
        case .keyNoteTo:
            return "Choose key to transpose to"
        case .capoNoteFrom:
            return "Choose key to play in"
        case .capoNoteTo:
            return "Using the chords of key"
        default:
            return "Choose"
        }
    }
    
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
        delegate?.didChangeNoteValue()
    }
    
    func setTitleLabel(for type: NoteTitle) {
        noteTitleType = type
        titleLabel.text = type.rawValue
        configureToolBar()
    }
    
    private func configureUI() {
        contentView.addCardFeel(backgroundColor: contentViewBackgroundColor,
                                shadowIntensity: .low,
                                cornerRadius: .medium)
        
        configureToolBar()
        
        keyNotePickerViewItems = noteBank.prefix(12)
        
        keyNotePickerView.delegate = self
        keyNotePickerView.dataSource = self
        keyNotePickerView.backgroundColor = .taPurpleGray
        
        noteTextField.inputView = keyNotePickerView
        noteTextField.inputAccessoryView = toolBar
        noteTextField.textColor = .taBlack
    }
    
    private func configureToolBar() {
        let spacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        let pickerTitleButton = UIBarButtonItem(title: pickerTitle, style: .done, target: self, action: nil)
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = true
        toolBar.sizeToFit()
        toolBar.items = [spacer, pickerTitleButton, spacer]
        toolBar.isUserInteractionEnabled = false
        toolBar.tintColor = UIColor.taDarkGrey
    }
}

extension TransposerCardView: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return keyNotePickerViewItems.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return keyNotePickerViewItems[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedNoteIndex = row
        noteTextField.text = keyNotePickerViewItems[row]
        noteTextField.resignFirstResponder()
        delegate?.didChangeNoteValue()
    }
}

enum NoteTitle: String {
    case keyNoteFrom = "Key from"
    case keyNoteTo = "Key to"
    case capoNoteFrom = "Play in key"
    case capoNoteTo = "Chords of"
}
