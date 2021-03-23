//
//  LaunchViewModel.swift
//  TransposeApp
//
//  Created by Janco Erasmus on 2021/03/17.
//  Copyright © 2021 Janco Erasmus. All rights reserved.
//

import Foundation
import Network

protocol LaunchViewModelDelegate: NSObject {
    func didFinishLoading()
    func didFail(with error: String?)
}

class LaunchViewModel {
    
    weak var delegate: LaunchViewModelDelegate?
    var interactor: FirebaseBoundary
    var inAppPurchaseManager: InAppPurchaseHelper
    
    private var counter = 5
    var timer: Timer?
    
    init(delegate: LaunchViewModelDelegate,
         interactor: FirebaseBoundary,
         inAppPurchaseManager: InAppPurchaseHelper) {
        self.delegate = delegate
        self.interactor = interactor
        self.inAppPurchaseManager = inAppPurchaseManager
    }
    
    func requestProduct() {
        TransposeProduct.store.requestProducts { (success, products) in
            #warning("Use wenderlich code and see")
        }
    }
    
    func requestFeatureToggles() {
        counter = 5
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self,
                             selector: #selector(countDownServiceCallTime),
                             userInfo: nil, repeats: true)
    }
    
    @objc func countDownServiceCallTime() {
        if counter > 0 {
            makeServiceCall()
        } else {
            self.serviceCallFailed(with: "Transpose will continue offline")
        }
        counter -= 1
    }
    
    private func makeServiceCall() {
        interactor.fetchFeatureToggle {
            self.serviceSucceeded()
        } failure: { (_) in
            self.serviceCallFailed(with: "Service unavailable")
        }
    }
    
    private func serviceSucceeded() {
        self.stopTimer()
        Cache.sharedInstance.networkState = .online
        self.delegate?.didFinishLoading()
    }
    
    private func serviceCallFailed(with message: String?) {
        stopTimer()
        self.fallBackToDefaultSettings()
        Cache.sharedInstance.networkState = .offline
        self.delegate?.didFail(with: message ?? "")
    }
    
    private func stopTimer() {
        self.timer?.invalidate()
        self.timer = nil
    }
    
    private func fallBackToDefaultSettings() {
        Cache.sharedInstance.isAdsTurnedOn = false
        Cache.sharedInstance.isSettingsTurnedOn = false
    }
}
