//
//  SettingsViewModel.swift
//  TransposeApp
//
//  Created by Janco Erasmus on 2021/03/10.
//  Copyright © 2021 Janco Erasmus. All rights reserved.
//

import Foundation

#warning("make cache a shared instance")
struct Cache {
    
    var useSharpNotes = true // to be stored in a user cache OR userDefaults
    
    var sharpNotes = ["A","A#","B","C","C#","D","D#","E","F","F#","G","G#",
                      "A","A#","B","C","C#","D","D#","E","F","F#","G","G#",
                      "A","A#","B","C","C#","D","D#","E","F","F#","G","G#"]
    
    var flatNotes = ["A","Ab","B","C","Cb","D","Db","E","F","Fb","G","Gb",
                     "A","Ab","B","C","Cb","D","Db","E","F","Fb","G","Gb",
                     "A","Ab","B","C","Cb","D","Db","E","F","Fb","G","Gb"]
}
