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
    case stubbed = "isStubbed"
    case chordBuilder = "isChordBuilderActive"
}

enum Environment: String {
    case prod = "PROD"
    case uat = "UAT"
}

class FirebaseInteractor: FirebaseBoundary {
    func fetchFeatureToggle(success: @escaping EmptySuccessResponse, failure: @escaping FirebaseFailedRequest) {
        
    }
    
//    var reference: DatabaseReference = Database.database().reference()
//    
//    func fetchFeatureToggle(success: @escaping EmptySuccessResponse, failure: @escaping FirebaseFailedRequest) {
//        let environment = UIApplication.appEnvironment
//        let operation = "featureToggle"
//        reference.child("environments").child(environment!).child(operation).observeSingleEvent(of: .value, with: { (snapshot) in
//            let value = snapshot.value as? NSDictionary
//            let isAdsTurnedOn = value?[FeatureToggleNames.ads.rawValue] as? Bool ?? true
//            let isSettingsTurnedOn = value?[FeatureToggleNames.settings.rawValue] as? Bool ?? true
//            let isStubbed = value?[FeatureToggleNames.stubbed.rawValue] as? Bool ?? false
//            let isChordBuilderActive = value?[FeatureToggleNames.chordBuilder.rawValue] as? Bool ?? false
//            Cache.sharedInstance.isAdsTurnedOn = isAdsTurnedOn
//            Cache.sharedInstance.isSettingsTurnedOn = isSettingsTurnedOn
//            Cache.sharedInstance.isStubbed = isStubbed
//            Cache.sharedInstance.isChordBuilderActive = isChordBuilderActive
//            success()
//        }) { (error) in
//            print(error.localizedDescription)
//            failure(error.localizedDescription)
//        }
//    }
}
