//
//  GuitarChordCardView.swift
//  TransposeApp
//
//  Created by Janco Erasmus on 2021/03/24.
//  Copyright © 2021 Janco Erasmus. All rights reserved.
//

import UIKit

protocol GuitarChordViewDelegate {
    func closeTapped()
}

class GuitarChordCardView: UIView {

    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var guitarNeckView: UIView!
    @IBOutlet weak var loadingStackView: UIStackView!
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    @IBOutlet weak var neckBar: UIView!
    @IBOutlet weak var errorContentView: UIView!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var chordNameLabel: UILabel!
    @IBOutlet weak var previousButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    // MARK: - Guitar String Outlets
    
    @IBOutlet weak var eLowString: UIView!
    @IBOutlet weak var aString: UIView!
    @IBOutlet weak var dString: UIView!
    @IBOutlet weak var gString: UIView!
    @IBOutlet weak var bString: UIView!
    @IBOutlet weak var eHighString: UIView!
    
    // MARK: - Fret Board Number Outlets
    
    @IBOutlet weak var firstFretLabel: UILabel!
    @IBOutlet weak var secondFretLabel: UILabel!
    @IBOutlet weak var thirdFretLabel: UILabel!
    @IBOutlet weak var fourthFretLabel: UILabel!
    @IBOutlet weak var fifthFretLabel: UILabel!
    
    // MARK: - Note Pint Outlets
    
    @IBOutlet weak var eOne: PintView!
    @IBOutlet weak var eTwo: PintView!
    @IBOutlet weak var eThree: PintView!
    @IBOutlet weak var eFour: PintView!
    @IBOutlet weak var eFive: PintView!
    
    @IBOutlet weak var aOne: PintView!
    @IBOutlet weak var aTwo: PintView!
    @IBOutlet weak var aThree: PintView!
    @IBOutlet weak var aFour: PintView!
    @IBOutlet weak var aFive: PintView!
    
    
    @IBOutlet weak var dOne: PintView!
    @IBOutlet weak var dTwo: PintView!
    @IBOutlet weak var dThree: PintView!
    @IBOutlet weak var dFour: PintView!
    @IBOutlet weak var dFive: PintView!
    
    @IBOutlet weak var gOne: PintView!
    @IBOutlet weak var gTwo: PintView!
    @IBOutlet weak var gThree: PintView!
    @IBOutlet weak var gFour: PintView!
    @IBOutlet weak var gFive: PintView!
    
    
    @IBOutlet weak var bOne: PintView!
    @IBOutlet weak var bTwo: PintView!
    @IBOutlet weak var bThree: PintView!
    @IBOutlet weak var bFour: PintView!
    @IBOutlet weak var bFive: PintView!
    
    @IBOutlet weak var eHOne: PintView!
    @IBOutlet weak var eHTwo: PintView!
    @IBOutlet weak var eHThree: PintView!
    @IBOutlet weak var eHFour: PintView!
    @IBOutlet weak var eHFive: PintView!
    
    var delegate: GuitarChordViewDelegate?
    // var chordPack: ChordPack!
    
    var chordStructurePack: [ChordModelStructure]!
    var displayedChord: ChordModelStructure!
    var firestoreInteractor = ChordBuilderInteractor()
    
    private var notePints: [PintView]?
    private var currentDisplayedChord: ChordModel?
    private var currentChordIndex = 0
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.setupNib()
        self.configureUI()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureUI()
    }
    
    init(frame: CGRect, chordPack: ChordPack) {
        super.init(frame: frame)
        // self.chordPack = chordPack
        self.setupNib()
        self.configureUI()
        showLoading(true)
    }
    
    @IBAction func closeButtonTapped(_ sender: Any) {
        showErrorView(false, note: "")
        delegate?.closeTapped()
    }
    
    @IBAction func previousChordTapped(_ sender: Any) {
        currentChordIndex -= 1
        nextButton.show()
        showChord(at: currentChordIndex)
        currentChordIndex <= 0 ? previousButton.hide() : previousButton.show()
    }
    
    @IBAction func nextChordTapped(_ sender: Any) {
        currentChordIndex += 1
        previousButton.show()
        showChord(at: currentChordIndex)
        currentChordIndex >= chordStructurePack.count - 1 ? nextButton.hide() : nextButton.show()
    }
    
    func configureUI() {
        contentView.addCardFeel(backgroundColor: .taWhite,
                                shadowIntensity: .puffed,
                                cornerRadius: .medium)
        populateNotePints()
        resetChordChart()
        previousButton.hide()
        // showChord(at: currentChordIndex)
    }
    
    func loadChordPack(note: String) {
        firestoreInteractor.fetchChordPack(note: note) { response in
            self.showLoading(false)
            self.chordStructurePack = response
            guard !response.isEmpty else { /*Handle empty response*/ return }
            self.showChord(at: 0)
        } failure: { error in
            self.showErrorView(true, note: note)
        }
    }
        
    func resetChordChart() {
        for pint in notePints! {
            pint.isHidden = true
        }
    }
    
    private func populateNotePints() {
        let openString = PintView()
        notePints = [openString,
                     eOne, eTwo, eThree, eFour, eFive,
                     aOne, aTwo, aThree, aFour, aFive,
                     dOne, dTwo, dThree, dFour, dFive,
                     gOne, gTwo, gThree, gFour, gFive,
                     bOne, bTwo, bThree, bFour, bFive,
                     eHOne, eHTwo, eHThree, eHFour, eHFive]
    }
        
    private func placeNotePints() {
        for number in displayedChord.structure! {
            if number > 0 {
                self.notePints![number].isHidden = false
                self.notePints![number].defaultStyle()
            } else if number == -1 {
                // mark x on neckBoard
            }
        }
    }
    
    private func placeBarPints() {
        if displayedChord.isBarChord! {
            for i in 0..<6 {
                if displayedChord.structure![i] != -1 {
                    notePints![displayedChord.barFretNumber!].isHidden = false
                    notePints![displayedChord.barFretNumber!].styleAsBarPint()
                }
                displayedChord.barFretNumber! += 5
            }
        }
    }
    
    private func configureFretNumbers() {
        if displayedChord.startingFretNumber! > 1 {
            neckBar.isHidden = true
            firstFretLabel.text = String(displayedChord.startingFretNumber!)
            secondFretLabel.text = String(displayedChord.startingFretNumber! + 1)
            thirdFretLabel.text = String(displayedChord.startingFretNumber! + 2)
            fourthFretLabel.text = String(displayedChord.startingFretNumber! + 3)
            fifthFretLabel.text = String(displayedChord.startingFretNumber! + 4)
        }
    }
    
    private func showChord(at index: Int) {
        resetChordChart()
        // currentDisplayedChord = chordPack?.chords[index]
        displayedChord = chordStructurePack[index]
        chordNameLabel.text = chordStructurePack[index].name
        placeNotePints()
        placeBarPints()
        configureFretNumbers()
    }
    
    private func showLoading(_ bool: Bool) {
        bool ? loadingIndicator.startAnimating() : loadingIndicator.stopAnimating()
        loadingStackView.isHidden = !bool
        guitarNeckView.isHidden = bool
        nextButton.isHidden = bool
        previousButton.isHidden = bool
    }
    
    private func showErrorView(_ bool: Bool, note: String) {
        errorContentView.isHidden = !bool
        errorLabel.text = String(format: "Please bear with us.\n\nWe are working on %@ shapes.", note)
        chordNameLabel.text = "Under Construction"
    }
}

extension Int {
    
    var boolValue: Bool {
        return self == 1
    }
}

extension UIButton {
    
    func hide() {
        self.isHidden = true
        self.alpha = 0.5
    }
    
    func show() {
        self.isHidden = false
        self.alpha = 1
    }
}
