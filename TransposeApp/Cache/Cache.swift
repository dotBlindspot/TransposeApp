//
//  SettingsViewModel.swift
//  TransposeApp
//
//  Created by Janco Erasmus on 2021/03/10.
//  Copyright © 2021 Janco Erasmus. All rights reserved.
//

import Foundation
import Network

enum NetworkState {
    case online
    case offline
}

struct Cache {
    
    static var sharedInstance = Cache()
    
    var networkState: NetworkState?
    
    // MARK: - Feature Toggels
    
    var isSettingsTurnedOn = true
    var isAdsTurnedOn = true
    var isStubbed = false
    var isChordBuilderActive = false
    
    // MARK: - AdMob Data
    private let stubbedBannerAdUnitID = "ca-app-pub-3940256099942544/2934735716"
    private let stubbedInterstitialAdUnitID = "ca-app-pub-3940256099942544/4411468910"
    private let productionBannerAdUnitID = "ca-app-pub-4040587998998922/5777511147"
    private let productionInterstitialAdUnitID = "ca-app-pub-4040587998998922/1560718513"
    
    // MARK: - Product Purchased
    var isTransposeAppPurchased: Bool {
        UserDefaults.standard.bool(forKey: PurchaseKeys.purchased.rawValue)
    }
    
    var shouldShowRemoveAdsFlyer: Bool {
        return !isTransposeAppPurchased && !UserDefaults.standard.bool(forKey: FlyerName.removeAds.rawValue)
    }
    
    var bannerAdUnitID: String {
        return Cache.sharedInstance.isStubbed ? stubbedBannerAdUnitID : productionBannerAdUnitID
    }
    
    var interstitialAdUnitID: String {
        return Cache.sharedInstance.isStubbed ? stubbedInterstitialAdUnitID : productionInterstitialAdUnitID
    }

    var requestType: TransposeRequestType = .keys
    
    var isKeysRequestType: Bool {
        return requestType == .keys
    }
    
    var sharpNotes = ["A","A#","B","C","C#","D","D#","E","F","F#","G","G#",
                      "A","A#","B","C","C#","D","D#","E","F","F#","G","G#",
                      "A","A#","B","C","C#","D","D#","E","F","F#","G","G#"]
    
    var flatNotes = ["A","Bb","B","C","Db","D","Eb","E","F","Gb","G","Ab",
                     "A","Bb","B","C","Db","D","Eb","E","F","Gb","G","Ab",
                     "A","Bb","B","C","Db","D","Eb","E","F","Gb","G","Ab"]
}

enum FlyerName: String {
    case removeAds = "Remove Ads"
}
