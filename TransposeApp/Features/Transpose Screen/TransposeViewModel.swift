//
//  TransposeViewModel.swift
//  TransposeApp
//
//  Created by Janco Erasmus on 2021/03/10.
//  Copyright © 2021 Janco Erasmus. All rights reserved.
//

import Foundation
import GoogleMobileAds
import Network

protocol TransposeViewModelDelegate: NSObject {
    func finishedAdRequest(_ interstitialAd: GADInterstitialAdBeta?)
    func systemNowOnline()
    func productPurchased()
}

class TransposeViewModel: Staffable {
    
    weak var delegate: TransposeViewModelDelegate?
    private var interactor: AdManagerInteractor!
    private var firebaseInteractor: FirebaseBoundary!
    private var inAppPurchaseHandler: InAppPurchaseHandler?
    private var networkManager: CellularNetworkManager?
    private var _requestType: TransposeRequestType = Cache().requestType
    private var fromNumber: Int = 0
    private var toNumber: Int = 0
    private var addCounter = 0
    private let monitor: NWPathMonitor
    
    var isAdInCache: Bool = false
    
    init(delegate: TransposeViewModelDelegate,
         interactor: AdManagerInteractor,
         firebaseInteractor: FirebaseBoundary,
         inAppPurchaseHandler: InAppPurchaseHandler) {
        self.delegate = delegate
        self.interactor = interactor
        self.addCounter += 1
        self.monitor = NWPathMonitor()
        self.inAppPurchaseHandler = inAppPurchaseHandler
        self.inAppPurchaseHandler?.delegate = self
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
    
    var shouldShowBannerAd: Bool {
        return Cache.sharedInstance.isAdsTurnedOn && !Cache.sharedInstance.isTransposeAppPurchased
    }
    
    var shouldRequestAd: Bool {
        if Cache.sharedInstance.isAdsTurnedOn && !isAdInCache && !Cache.sharedInstance.isTransposeAppPurchased {
            guard addCounter % 8 == 0 && addCounter % 11 == 0 else { return false }
            return true
        }
        return false
    }
    
    var attemptBuildingChord: Bool {
        return Cache.sharedInstance.isChordBuilderActive
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
                self.isAdInCache = true
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
    
    func observeNetwork() {
        networkManager = CellularNetworkManager(delegate: self)
        networkManager!.observeNetwork()
    }
    
    func fetchAndBuyProduct() {
        inAppPurchaseHandler?.fetchProducts()
    }
}

extension TransposeViewModel: CellularNetworkObservable {
    
    func didUpdateNetworkStatus() {
        delegate?.systemNowOnline()
    }
}

extension TransposeViewModel: InAppPurchaseHandlerDelegate {
    
    func productsFetchedSuccessfully() {
        inAppPurchaseHandler?.makeNewPurchase()
    }
    
    func paymentSuccessful(for product: SKProduct) {
        delegate?.productPurchased()
    }
    
    func paymentError(error: String) {
        
    }
    
    func restoredSuccessfully() {
        
    }
}
