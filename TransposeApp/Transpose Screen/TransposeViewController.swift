//
//  TransposeViewController.swift
//  TransposeApp
//
//  Created by Janco Erasmus on 2021/03/10.
//  Copyright © 2021 Janco Erasmus. All rights reserved.
//

import UIKit

class TransposeViewController: UIViewController {

    @IBOutlet weak var transposerCardContainerView: UIView!
    @IBOutlet weak var fromTransposerCardView: TransposerCardView!
    @IBOutlet weak var toTransposerCardView: TransposerCardView!
    @IBOutlet weak var notesCardContainerView: UIView!
    @IBOutlet weak var notesStackView: UIStackView!
    
    @IBOutlet weak var transposeButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        stackNotes()
    }
    
    private func stackNotes() {
        let scalePack = createScalePack()
        for note in scalePack {
            notesStackView.addArrangedSubview(note)
        }
    }
    
    private func createScalePack() -> [TransposedNoteView] {
        var scalePack = [TransposedNoteView]()
        for number in 1..<8  {
            let note = TransposedNoteView()
            note.populateNoteView(noteNumber: String(number),
                                  noteFrom: "",
                                  noteTo: "")
            note.addCorners(size: .medium)
            scalePack.append(note)
        }
        return scalePack
    }
    
    private func configureUI() {
        notesCardContainerView.addCardFeel(backgroundColor: .white,
                                           shadowIntensity: .mild,
                                           cornerRadius: .small)
        transposerCardContainerView.addCardFeel(backgroundColor: .white,
                                                shadowIntensity: .mild,
                                                cornerRadius: .small)
        fromTransposerCardView.titleLabelText = "Key from"
        toTransposerCardView.titleLabelText = "Key to"
        transposeButton.makePrimaryButton()
        addShadowAndCornersToStackView()
    }
    
    private func addShadowAndCornersToStackView() {
//        notesStackView.addBackground(.white)
//        notesStackView.subviews[0].addCardFeel(shadowIntensity: .high,
//                                               cornerRadius: .medium)
    }
}
