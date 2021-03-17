//
//  FirebaseInteractor.swift
//  TransposeApp
//
//  Created by Janco Erasmus on 2021/03/17.
//  Copyright © 2021 Janco Erasmus. All rights reserved.
//

import Foundation
import Firebase

enum FeatureToggleNames: String {
    case ads = "isAdsTurnedOn"
    case settings = "isSettingsTurnedOn"
}

class FirebaseInteractor: FirebaseBoundary {
    var reference: DatabaseReference = Database.database().reference()
    
    func fetchFeatureToggle(success: @escaping EmptySuccessResponse, failure: @escaping FirebaseFailedRequest) {
        let operation = "featureToggle"
        reference.child("\(operation)").observeSingleEvent(of: .value, with: { (snapshot) in
            let value = snapshot.value as? NSDictionary
            let isAdsTurnedOn = value?[FeatureToggleNames.ads.rawValue] as? Bool ?? true
            let isSettingsTurnedOn = value?[FeatureToggleNames.settings.rawValue] as? Bool ?? true
            Cache.sharedInstance.isAdsTurnedOn = isAdsTurnedOn
            Cache.sharedInstance.isSettingsTurnedOn = isSettingsTurnedOn
            success()
        }) { (error) in
            print(error.localizedDescription)
            failure(error.localizedDescription)
        }
    }
}
