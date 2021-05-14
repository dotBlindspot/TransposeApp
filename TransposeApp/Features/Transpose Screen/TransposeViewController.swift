//
//  TransposeViewController.swift
//  TransposeApp
//
//  Created by Janco Erasmus on 2021/03/10.
//  Copyright © 2021 Janco Erasmus. All rights reserved.
//

import UIKit
import GoogleMobileAds

enum TransposeRequestType {
    case keys
    case capo
}

class TransposeViewController: UIViewController {

    @IBOutlet weak var settingsBarButtonItem: UIBarButtonItem!
    @IBOutlet weak var segementedKeysCapoControl: UISegmentedControl!
    @IBOutlet weak var transposerCardContainerView: UIView!
    @IBOutlet weak var fromTransposerCardView: TransposerCardView!
    @IBOutlet weak var toTransposerCardView: TransposerCardView!
    @IBOutlet weak var notesCardContainerViewHeading: UILabel!
    @IBOutlet weak var notesCardContainerView: UIView!
    @IBOutlet weak var notesStackView: UIStackView!
    @IBOutlet weak var bannerView: GADBannerView!
    
    private var scalePackForStackView = [TransposedNoteView]()
    private var interstitialAd: GADInterstitialAdBeta?
    lazy var viewModel = TransposeViewModel(delegate: self,
                                            interactor: AdManagerInteractor(),
                                            firebaseInteractor: FirebaseInteractor())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        stackNotes()
        viewModel.observeNetwork()
        viewModel.requestAd()
        initBannerAdView()
    }
            
    private func configureUI() {
        notesStackView.isUserInteractionEnabled = true
        settingsBarButtonItem.isEnabled = Cache.sharedInstance.isSettingsTurnedOn
        if #available(iOS 13.0, *) {} else {
            settingsBarButtonItem.title = "Settings"
        }
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
        viewModel.requestAd()
    }
    
    private func transpose() {
        let noteFromIndex = fromTransposerCardView.selectedNoteIndex
        let noteToIndex = toTransposerCardView.selectedNoteIndex
        
        let fromNoteScale = viewModel.scaleOf(noteFromIndex)
        let toNoteScale = viewModel.requestScale(fromNote: noteFromIndex,
                                                 toNote: noteToIndex)
        
        populateScalePack(fromScale: fromNoteScale, toScale: toNoteScale)
        updateUIValuesForRequestType()
        viewModel.requestAd()
    }
    
    private func createNoteViews() {
        for _ in 1..<8 {
            let transposedNoteView = TransposedNoteView(frame: CGRect(x: 0, y: 0, width: notesStackView.frame.width, height: 50))
            transposedNoteView.clearLabels()
            transposedNoteView.addCorners(size: .medium)
            transposedNoteView.delegate = self
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
    
    private func initBannerAdView() {
        if Cache.sharedInstance.isAdsTurnedOn {
            let adUnitID = Cache().bannerAdUnitID
            bannerView.adUnitID = adUnitID
            bannerView.rootViewController = self
            bannerView.load(GADRequest())
        }
    }
    
    private func displayChordChart(name: String, constitution: [Int]) {
        let blurView = UIView(frame: self.view.bounds)
        blurView.backgroundColor = UIColor.taBlack
        blurView.alpha = 0.5
        blurView.tag = 99
        self.view.addSubview(blurView)
        
        let chordCardView = GuitarChordCardView(frame: CGRect(x: 0, y: 0, width: 280, height: 490))
        chordCardView.delegate = self
        chordCardView.center = CGPoint(x: self.view.frame.size.width  / 2,
                                       y: self.view.frame.size.height / 2)
        chordCardView.buildChord(name: name, constitution: constitution)
        
        chordCardView.tag = 100
        chordCardView.isUserInteractionEnabled = true
        self.view.addSubview(chordCardView)
        
//        let tapGesture = UITapGestureRecognizer(target:self, action: #selector(cardTapped))
//        chordCardView.addGestureRecognizer(tapGesture)
    }
    
//    @objc internal func cardTapped() {
//        if let viewWithTag = self.view.viewWithTag(100) {
//            viewWithTag.removeFromSuperview()
//        }
//
//        if let viewWithTag = self.view.viewWithTag(99) {
//            viewWithTag.removeFromSuperview()
//        }
//    }
}

extension TransposeViewController: TransposerCardViewDelegate {
    func didChangeNoteValue() {
        self.transpose()
    }
}

extension TransposeViewController: TransposeViewModelDelegate {
    func systemNowOnline() {
        viewModel.requestAd()
        initBannerAdView()
    }

    func finishedAdRequest(_ interstitialAd: GADInterstitialAdBeta?) {
        guard let interstitialAd = interstitialAd else { return }
        interstitialAd.present(fromRootViewController: self)
        viewModel.isAdInCache = false
    }
}

extension TransposeViewController: TransposedNoteViewDelegate {
    
    func tappedNoteTo(note: String) {
        guard viewModel.attemptBuildingChord else { return }
        displayChordChart(name: note, constitution: ChordBuilder().chordConstitution(for: note))
        viewModel.requestAd()
    }
    
    func tappedNoteFrom(note: String) {
        guard viewModel.attemptBuildingChord else { return }
        displayChordChart(name: note, constitution: ChordBuilder().chordConstitution(for: note))
        viewModel.requestAd()
    }
}

extension TransposeViewController: GuitarChordViewDelegate {
    
    func closeTapped() {
        if let viewWithTag = self.view.viewWithTag(100) {
            viewWithTag.removeFromSuperview()
        }
        
        if let viewWithTag = self.view.viewWithTag(99) {
            viewWithTag.removeFromSuperview()
        }
    }
}
