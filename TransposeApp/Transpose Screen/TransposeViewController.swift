//
//  TransposeViewController.swift
//  TransposeApp
//
//  Created by Janco Erasmus on 2021/03/10.
//  Copyright © 2021 Janco Erasmus. All rights reserved.
//

import UIKit

enum TransposeRequestType {
    case keys
    case capo
}

class TransposeViewController: UIViewController {

    @IBOutlet weak var segementedKeysCapoControl: UISegmentedControl!
    @IBOutlet weak var transposerCardContainerView: UIView!
    @IBOutlet weak var fromTransposerCardView: TransposerCardView!
    @IBOutlet weak var toTransposerCardView: TransposerCardView!
    @IBOutlet weak var notesCardContainerViewHeading: UILabel!
    @IBOutlet weak var notesCardContainerView: UIView!
    @IBOutlet weak var notesStackView: UIStackView!
    
    private var scalePackForStackView = [TransposedNoteView]()
    lazy var viewModel = TransposeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        stackNotes()
    }
            
    private func configureUI() {
        notesCardContainerView.addCardFeel(backgroundColor: .white,
                                           shadowIntensity: .mild,
                                           cornerRadius: .small)
        transposerCardContainerView.addCardFeel(backgroundColor: .white,
                                                shadowIntensity: .mild,
                                                cornerRadius: .small)
        updateUIValuesForRequestType()
        fromTransposerCardView.delegate = self
        toTransposerCardView.delegate = self
        createNoteViews()
        stackNotes()
    }
    
    private func updateUIValuesForRequestType() {
        switch viewModel.requestType {
        case .keys:
            fromTransposerCardView.titleLabelText = "Key from"
            toTransposerCardView.titleLabelText = "Key to"
            notesCardContainerViewHeading.styleForKeys()
        case .capo:
            fromTransposerCardView.titleLabelText = "Play in key"
            toTransposerCardView.titleLabelText = "Using chords of"
            notesCardContainerViewHeading.styleForCapoOn(fretNumber: viewModel.fretNumber)
            #warning("Place Capo on fret comes here - Show fret Board animation")
        }
    }
    
    @IBAction func segementedKeysCapoControlTapped(_ sender: Any) {
        if segementedKeysCapoControl.selectedSegmentIndex == 0 {
            viewModel.requestType = .keys
        } else {
            viewModel.requestType = .capo
        }
        updateUIValuesForRequestType()
    }
    
    private func transpose() {
        let noteFromIndex = fromTransposerCardView.selectedNoteIndex
        let noteToIndex = toTransposerCardView.selectedNoteIndex
        
        let fromNoteScale = viewModel.scaleOf(noteFromIndex)
        let toNoteScale = viewModel.requestScale(fromNote: noteFromIndex,
                                                           toNote: noteToIndex)
        
        populateScalePack(fromScale: fromNoteScale, toScale: toNoteScale)
        updateUIValuesForRequestType()
    }
    
    private func createNoteViews() {
        for _ in 1..<8 {
            let transposedNoteView = TransposedNoteView()
            transposedNoteView.addCorners(size: .medium)
            scalePackForStackView.append(transposedNoteView)
        }
    }
    
    private func populateScalePack(fromScale: [String], toScale: [String]) {
        for number in 0..<scalePackForStackView.count  {
            let transposedNoteView = scalePackForStackView[number]
            transposedNoteView.populateNoteView(noteNumber: String(number + 1),
                                  noteFrom: fromScale[number],
                                  noteTo: toScale[number])
        }
    }
    
    private func stackNotes() {
        guard !scalePackForStackView.isEmpty else { return }
        for noteView in scalePackForStackView {
            notesStackView.addArrangedSubview(noteView)
        }
    }
}

extension TransposeViewController: TransposerCardViewDelegate {
    func didChangeNoteValue() {
        self.transpose()
    }
}
