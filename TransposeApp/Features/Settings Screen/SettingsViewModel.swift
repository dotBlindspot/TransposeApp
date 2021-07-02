//
//  SettingsViewModel.swift
//  TransposeApp
//
//  Created by Janco Erasmus on 2021/03/16.
//  Copyright © 2021 Janco Erasmus. All rights reserved.
//

import Foundation
import UIKit

struct SettingsModel {
    var imageIcon: UIImage?
    var name: String
    var isOn: Bool
}

class SettingsViewModel {
    
    let defaults = UserDefaults.standard
    private var settingsModels = [SettingsModel]()
    private var inAppPurchaseHandler: InAppPurchaseHandler?
    var didReceiveProducts = false
    
    init(inAppPurchaseHandler: InAppPurchaseHandler) {
        settingsModels.append(useFlatNotesSetting)
        self.inAppPurchaseHandler = inAppPurchaseHandler
    }
    
    var settingsModelsCount: Int {
        return settingsModels.count
    }
    
    var requestSettingsModels: [SettingsModel] {
        return self.settingsModels
    }
    
    var isTransposedAlreadyPurchased: Bool {
        return Cache.sharedInstance.isTransposeAppPurchased
    }
    
    func requestSettingsModel(at index: Int) -> SettingsModel {
        return settingsModels[index]
    }
    
    private var useFlatNotesSetting: SettingsModel {
        if #available(iOS 13.0, *) {
            return SettingsModel(imageIcon: UIImage(systemName: "music.note"),
                                 name: "Use flat notes",
                                 isOn: defaults.bool(forKey: "useFlatNotes"))
        } else {
            return SettingsModel(imageIcon: UIImage(named: "musical-note"),
                                 name: "Use flat notes",
                                 isOn: defaults.bool(forKey: "useFlatNotes"))
        }
    }
    
    func fetchProducts() {
        if !isTransposedAlreadyPurchased {
            inAppPurchaseHandler?.fetchProducts()
        }
    }
    
    func buyProduct() {
        inAppPurchaseHandler?.makeNewPurchase()
    }
    
    func restoreProducts() {
        inAppPurchaseHandler?.restorePurchases()
    }
    
    func set(inAppPurchaseHandlerDelegate: InAppPurchaseHandlerDelegate) {
        self.inAppPurchaseHandler?.delegate = inAppPurchaseHandlerDelegate
    }
}
