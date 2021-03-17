//
//  LaunchViewModel.swift
//  TransposeApp
//
//  Created by Janco Erasmus on 2021/03/17.
//  Copyright © 2021 Janco Erasmus. All rights reserved.
//

import Foundation

class LaunchViewModel {
    
    weak var delegate: LaunchViewModelDelegate?
    var interactor: FirebaseBoundary
    
    init(delegate: LaunchViewModelDelegate,
         interactor: FirebaseBoundary) {
        self.delegate = delegate
        self.interactor = interactor
    }
    
    func requestFeatureToggles() {
        interactor.fetchFeatureToggle {
            self.delegate?.didFinishLoading()
        } failure: { (_) in
            self.fallBackToDefaultSettings()
        }
    }
    
    private func fallBackToDefaultSettings() {
        Cache.sharedInstance.isAdsTurnedOn = false
        Cache.sharedInstance.isSettingsTurnedOn = false
    }
}
