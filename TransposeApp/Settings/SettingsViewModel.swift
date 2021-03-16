//
//  SettingsViewModel.swift
//  TransposeApp
//
//  Created by Janco Erasmus on 2021/03/16.
//  Copyright © 2021 Janco Erasmus. All rights reserved.
//

import Foundation

class SettingsViewModel {
    
    let defaults = UserDefaults.standard
    private var settingsModels = [SettingsModel]()
    
    init() {
        settingsModels.append(useFlatNotesSetting)
    }
    
    var settingsModelsCount: Int {
        return settingsModels.count
    }
    
    var requestSettingsModels: [SettingsModel] {
        return self.settingsModels
    }
    
    func requestSettingsModel(at index: Int) -> SettingsModel {
        return settingsModels[index]
    }
    
    private var useFlatNotesSetting: SettingsModel {
        return SettingsModel(name: "Use flat notes", isOn: defaults.bool(forKey: "useFlatNotes"))
    }
    
}

struct SettingsModel {
    var name: String
    var isOn: Bool
}
