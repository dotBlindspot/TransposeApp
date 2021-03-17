//
//  AdManagerInteractor.swift
//  TransposeApp
//
//  Created by Janco Erasmus on 2021/03/16.
//  Copyright © 2021 Janco Erasmus. All rights reserved.
//

import Foundation
import GoogleMobileAds

enum AdTypes {
    case interstitial
    case banner
}

typealias InterstitialAdRequestSuccess = (GADInterstitialAdBeta) -> Void
typealias BannerAdRequestSuccess = (GADMediationBannerAd) -> Void
typealias AdRequestFail = (_ error: String) -> Void

struct AdManagerInteractor {
    
    func loadInterstitialAd(success: @escaping InterstitialAdRequestSuccess,
                            failure: @escaping AdRequestFail) {
        let request = GADRequest()
        let adUnitID = Cache().interstitialAdUnitID
        GADInterstitialAdBeta.load(withAdUnitID: adUnitID,
                                   request: request) { (interstitialAd, error) in
            if let error = error {
                failure(error.localizedDescription)
            } else {
                success(interstitialAd!)
            }
        }
    }
}

/*
 GADInterstitialAd.load(withAdUnitID:"ca-app-pub-3940256099942544/4411468910",
                             request: request,
                   completionHandler: { [self] ad, error in
                     if let error = error {
                       print("Failed to load interstitial ad with error: \(error.localizedDescription)")
                       return
                     }
                     success()ad = ad
                   }
 */
