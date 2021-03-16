//
//  TransposeViewModel.swift
//  TransposeApp
//
//  Created by Janco Erasmus on 2021/03/10.
//  Copyright © 2021 Janco Erasmus. All rights reserved.
//

import Foundation
import GoogleMobileAds

protocol TransposeViewModelDelegate: NSObject {
    func finishedAdRequest(_ interstitialAd: GADInterstitialAdBeta?)
}

class TransposeViewModel: Staffable {
    
    weak var delegate: TransposeViewModelDelegate?
    private var interactor: AdManagerInteractor!
    private var _requestType: TransposeRequestType = Cache().requestType
    private var fromNumber: Int = 0
    private var toNumber: Int = 0
    private var addCounter = 0
    
    init(delegate: TransposeViewModelDelegate,
         interactor: AdManagerInteractor) {
        self.delegate = delegate
        self.interactor = interactor
        self.addCounter += 1
    }
    
    var requestType: TransposeRequestType {
        get {
            _requestType
        }
        set {
            _requestType = newValue
        }
    }
    
    var isRequestTypeKeys: Bool {
        return requestType == .keys
    }
    
    var shouldRequestAd: Bool {
        if Cache().isAdsTurnedOn {
            guard addCounter % 2 == 0 || addCounter % 5 == 0 else { return false }
            return true
        }
        return false
    }
    
    var fretNumber: Int {
        guard fromNumber != toNumber else { return 0 }
        let numericDifference = fromNumber - toNumber
        return numericDifference > 0 ? numericDifference : numericDifference + 12
    }
    
    func requestScale(fromNote: Int, toNote: Int) -> [String] {
        addCounter += 1
        setNoteNumberValues(fromNote: fromNote, toNote: toNote)
        return isRequestTypeKeys ? requestTransposedScale(fromNote: fromNote, toNote: toNote) : scaleOf(toNote)
    }
    
    func requestAd() {
        if shouldRequestAd {
            interactor.loadInterstitialAd { (interstitialAd) in
                self.delegate?.finishedAdRequest(interstitialAd)
            } failure: { (_) in
                self.delegate?.finishedAdRequest(nil)
            }
        }
    }
    
    private func requestTransposedScale(fromNote: Int, toNote: Int) -> [String] {
        let transposedNote = toNote - fromNote
        return scaleOf(transposedNote + fromNote)
    }
    
    
    private func setNoteNumberValues(fromNote: Int, toNote: Int) {
        self.fromNumber = fromNote
        self.toNumber = toNote
    }
}
