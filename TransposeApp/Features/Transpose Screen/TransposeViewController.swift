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
    @IBOutlet weak var tapOnChordHeader: UILabel!
    @IBOutlet weak var tapOnChordImageView: UIImageView!
    @IBOutlet weak var notesCardContainerViewHeading: UILabel!
    @IBOutlet weak var notesCardContainerView: UIView!
    @IBOutlet weak var notesStackView: UIStackView!
    @IBOutlet weak var bannerView: GADBannerView!
    
    private var scalePackForStackView = [TransposedNoteView]()
    private var interstitialAd: GADInterstitialAdBeta?
    lazy var viewModel = TransposeViewModel(delegate: self,
                                            interactor: AdManagerInteractor(),
                                            firebaseInteractor: FirebaseInteractor(),
                                            inAppPurchaseHandler: InAppPurchaseHandler())
    
    var backgroundView: UIView?
    var flyerView: PopupFlyerView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        stackNotes()
        showFlyers()
        viewModel.observeNetwork()
        viewModel.requestAd()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        initBannerAdView()
        
        let interactor = ChordBuilderInteractor()
        interactor.fetchChordPack(for: "A") { (response) in
            print("Structure: \(response[0].structure!)")
            print("Starting Number: \(response[0].startingFretNumber!)")
        } failure: { (error) in

        }
        // interactor.addChordPack(chordPack: ChordStructures.AmajorChordStructurePack)
    }
            
    private func configureUI() {
        notesStackView.isUserInteractionEnabled = true
        settingsBarButtonItem.isEnabled = Cache.sharedInstance.isSettingsTurnedOn
        tapOnChordHeader.isHidden = !Cache.sharedInstance.isChordBuilderActive
        tapOnChordImageView.isHidden = tapOnChordHeader.isHidden
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
            fromTransposerCardView.setTitleLabel(for: .keyNoteFrom)
            toTransposerCardView.setTitleLabel(for: .keyNoteTo)
            notesCardContainerViewHeading.styleForKeys()
        case .capo:
            fromTransposerCardView.setTitleLabel(for: .capoNoteFrom)
            toTransposerCardView.setTitleLabel(for: .capoNoteTo)
            notesCardContainerViewHeading.styleForCapoOn(fretNumber: viewModel.fretNumber)
            #warning("Place Capo on fret comes here - Show fret Board animation")
        }
    }
    
    private func showFlyers() {
        if Cache.sharedInstance.shouldShowRemoveAdsFlyer {
            backgroundView = UIView(frame: self.view.bounds)
            backgroundView?.backgroundColor = .gray
            backgroundView?.alpha = 0.7
            
            let flyerFrame = CGRect(x: 0, y: 0,
                                    width: self.view.bounds.width * 0.77,
                                    height: self.view.bounds.height * 0.7)
            flyerView = PopupFlyerView(frame: flyerFrame)
            flyerView?.center = CGPoint(x: self.view.frame.size.width/2,
                                       y: self.view.frame.size.height/2)
            flyerView?.contentView.layer.cornerRadius = 20
            flyerView?.delegate = self
            let stringAttributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20, weight: .semibold)]
            flyerView?.primaryButtonTitle = NSAttributedString(string: "Buy Remove Ads", attributes: stringAttributes)
            flyerView?.secondaryButtonTitle = NSAttributedString(string: "No, I like Ads", attributes: stringAttributes)
            self.view.addSubview(backgroundView!)
            self.view.addSubview(flyerView!)
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
        
        let fromNoteScale = viewModel.scaleOf(noteFromIndex ?? 0)
        let toNoteScale = viewModel.requestScale(fromNote: noteFromIndex ?? 0,
                                                 toNote: noteToIndex ?? 0)
        
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
        bannerView.isHidden = true
        if viewModel.shouldShowBannerAd {
            bannerView.isHidden = false
            let adUnitID = Cache().bannerAdUnitID
            bannerView.adUnitID = adUnitID
            bannerView.rootViewController = self
            bannerView.load(GADRequest())
        }
    }
    
    private func displayChordChart(for note: String) {
        let blurView = UIView(frame: self.view.bounds)
        blurView.backgroundColor = UIColor.taBlack
        blurView.alpha = 0.5
        blurView.tag = 99
        self.view.addSubview(blurView)
        
        let chordPack = ChordBuilder().chordPack(for: note)
        let chordCardView = GuitarChordCardView(frame: CGRect(x: 0, y: 0, width: 280, height: 490),
                                                chordPack: chordPack)
        chordCardView.delegate = self
        chordCardView.center = CGPoint(x: self.view.frame.size.width  / 2,
                                       y: self.view.frame.size.height / 2)
        // chordCardView.buildChord(name: name, constitution: constitution)
        
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
    
    func productPurchased() {
        initBannerAdView()
    }
}

extension TransposeViewController: TransposedNoteViewDelegate {
    
    func tappedNoteTo(note: String) {
        guard viewModel.attemptBuildingChord else { return }
        displayChordChart(for: note)
        viewModel.requestAd()
    }
    
    func tappedNoteFrom(note: String) {
        guard viewModel.attemptBuildingChord else { return }
        displayChordChart(for: note)
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

extension TransposeViewController: PopupFlyerViewDelegate {
    
    func tappedPrimaryButton(view: UIView, sender: Any) {
        removeFlyerView()
        viewModel.fetchAndBuyProduct()
    }
    
    func tappedSecondaryButton(view: UIView, sender: Any) {
        removeFlyerView()
    }
    
    func removeFlyerView() {
        UserDefaults.standard.set(true, forKey: FlyerName.removeAds.rawValue)
        for view in self.view.subviews {
            if view == backgroundView || view == flyerView {
                view.removeFromSuperview()
            }
        }
    }
}
