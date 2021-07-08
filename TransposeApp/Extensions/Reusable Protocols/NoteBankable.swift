//
//  Cachable.swift
//  TransposeApp
//
//  Created by Janco Erasmus on 2021/03/15.
//  Copyright © 2021 Janco Erasmus. All rights reserved.
//

import Foundation

protocol NoteBankable {
    var noteBank: [String] { get }
}

extension NoteBankable {
    
    var noteBank: [String] {
        let defaults = UserDefaults.standard
        let useFlatNotes = defaults.bool(forKey: "useFlatNotes")
        return useFlatNotes ? Cache.sharedInstance.flatNotes : Cache.sharedInstance.sharpNotes
    }
}
