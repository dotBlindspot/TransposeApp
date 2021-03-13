//
//  TransposeViewController.swift
//  TransposeApp
//
//  Created by Janco Erasmus on 2021/03/10.
//  Copyright © 2021 Janco Erasmus. All rights reserved.
//

import UIKit

class TransposeViewController: UIViewController {

    @IBOutlet weak var firstNoteView: TransposedNoteView!
    @IBOutlet weak var notesCardContainerView: UIView!
    @IBOutlet weak var notesStackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        firstNoteView.populateNoteView(noteNumber: "3rd", noteFrom: "C", noteTo: "B")
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
        notesCardContainerView.addCardFeel(shadowIntensity: .mild,
                                           cornerRadius: .large)
        addShadowAndCornersToStackView()
    }
    
    private func addShadowAndCornersToStackView() {
//        notesStackView.addBackground(.white)
//        notesStackView.subviews[0].addCardFeel(shadowIntensity: .high,
//                                               cornerRadius: .medium)
    }
}
