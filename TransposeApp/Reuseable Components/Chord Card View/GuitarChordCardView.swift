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
    @IBOutlet weak var neckBar: UIView!
    @IBOutlet weak var chordNameLabel: UILabel!
    
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
    
    private var notePints: [PintView]?
    
    private var notesNumbers: [Int]!
    private var isBarChord: Bool!
    private var barNumber: Int?
    private var startingFretNumber: Int!
    private var isCapoOn: Bool!
    private var capoNumber: Int?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupNib()
        self.configureUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.setupNib()
        self.configureUI()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureUI()
    }
    
    @IBAction func closeButtonTapped(_ sender: Any) {
        delegate?.closeTapped()
    }
    
    func configureUI() {
        contentView.addCardFeel(backgroundColor: .taWhite,
                                shadowIntensity: .puffed,
                                cornerRadius: .medium)
        populateNotePints()
        resetChordChart()
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
    
    func resetChordChart() {
        for pint in notePints! {
            pint.isHidden = true
        }
    }
    
    private func disassembleChordConstitution(constitution: [Int]) {
        notesNumbers = Array(constitution[0..<6])
        isBarChord = constitution[6].boolValue
        barNumber = constitution[7]
        startingFretNumber = constitution[8]
        isCapoOn = constitution[9].boolValue
        capoNumber = constitution[10]
    }
    
    private func placeNotePints() {
        for number in notesNumbers {
            if number > 0 {
                self.notePints![number].isHidden = false
            } else if number == -1 {
                // mark x on neckBoard
            }
        }
    }
    
    private func placeBarPints() {
        if isBarChord {
            for i in 0..<6 {
                if notesNumbers[i] != -1 {
                    notePints![barNumber!].isHidden = false
                    notePints![barNumber!].styleAsBarPint()
                }
                barNumber! += 5
            }
        }
    }
    
    private func configureFretNumbers() {
        if startingFretNumber > 1 {
            neckBar.isHidden = true
            firstFretLabel.text = String(startingFretNumber)
            secondFretLabel.text = String(startingFretNumber + 1)
            thirdFretLabel.text = String(startingFretNumber + 2)
            fourthFretLabel.text = String(startingFretNumber + 3)
            fifthFretLabel.text = String(startingFretNumber + 4)
        }
    }
    
    func buildChord(name: String, constitution: [Int]) {
        guard constitution.count == 11 else {
            chordNameLabel.text = "Not Available"
            return
        }
        /// Constitution layout - [E, A, D, G, B, E, BarChord - Bool (0), Bar Fret Number, First Fret Number, Capo On, Capo Number]
        
        chordNameLabel.text = name
        disassembleChordConstitution(constitution: constitution)
        placeNotePints()
        placeBarPints()
        configureFretNumbers()
    }
}

extension Int {
    
    var boolValue: Bool {
        return self == 1
    }
}
