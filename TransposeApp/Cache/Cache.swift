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
    
    // MARK: - Settings Availability
    
    var isSettingsTurnedOn = true
    
    // MARK: - AdMob Data
    
    var isAdsTurnedOn = true
    private var isStubbed = true
    private let stubbedBannerAdUnitID = "ca-app-pub-3940256099942544/2934735716"
    private let stubbedInterstitialAdUnitID = "ca-app-pub-3940256099942544/4411468910"
    private let productionBannerAdUnitID = "ca-app-pub-4040587998998922/5777511147"
    private let productionInterstitialAdUnitID = "ca-app-pub-4040587998998922/1560718513"
    
    var bannerAdUnitID: String {
        return isStubbed ? stubbedBannerAdUnitID : productionBannerAdUnitID
    }
    
    var interstitialAdUnitID: String {
        return isStubbed ? stubbedInterstitialAdUnitID : productionInterstitialAdUnitID
    }

    var requestType: TransposeRequestType = .keys
    
    var isKeysRequestType: Bool {
        return requestType == .keys
    }
    
    var sharpNotes = ["A","A#","B","C","C#","D","D#","E","F","F#","G","G#",
                      "A","A#","B","C","C#","D","D#","E","F","F#","G","G#",
                      "A","A#","B","C","C#","D","D#","E","F","F#","G","G#"]
    
    var flatNotes = ["A","Ab","B","C","Cb","D","Db","E","F","Fb","G","Gb",
                     "A","Ab","B","C","Cb","D","Db","E","F","Fb","G","Gb",
                     "A","Ab","B","C","Cb","D","Db","E","F","Fb","G","Gb"]
}
