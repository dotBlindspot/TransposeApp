//
//  Staffable.swift
//  TransposeApp
//
//  Created by Janco Erasmus on 2021/03/10.
//  Copyright © 2021 Janco Erasmus. All rights reserved.
//

import Foundation

protocol Staffable {
    var notes: [String] { get }
}

extension Staffable {
    
    var notes: [String] {
        let defaults = UserDefaults.standard
        let useFlatNotes = defaults.bool(forKey: "useFlatNotes")
        return useFlatNotes ? Cache().flatNotes : Cache().sharpNotes
    }
    
    func scaleOf(_ note: Int) -> [String] {
        return [notes[note],
                notes[note + 2] + "m",
                notes[note + 4] + "m",
                notes[note + 5],
                notes[note + 7],
                notes[note + 9] + "m",
                notes[note + 11] + "dim",
                notes[note]]
    }
}
