//
//  ChordBuilder.swift
//  TransposeApp
//
//  Created by Janco Erasmus on 2021/03/24.
//  Copyright © 2021 Janco Erasmus. All rights reserved.
//

import Foundation

struct ChordBuilder {
    
    /// Constitution layout - [E, A, D, G, B, E, BarChord - Bool (0), Bar Fret Number, First Fret Number, Capo On, Capo Number]
    /// String numbers: -1 String should not be played (X displayed on neckBar)
    ///             0  Open String
    /// Bar Chord: 0 represent false then normal open chord & 1 represent true then finger like component displayed
    /// First Fret Number: Allows to display which fret number are used
    /// Capo On: Display another chord in diffrent key that represent the same chord with Capo On (A can be G chord with Capo 2)
    
    private let Amajor  = [-1, 0, 12, 17, 22, 0, 0, 0, 1, 0, 0]
    private let Bbmajor = [-1, 0, 13, 18, 23, 0, 1, 1, 1, 0, 0]
    private let Bmajor  = [-1, 0, 14, 19, 24, 0, 1, 2, 1, 0, 0]
    private let Cmajor  = [-1, 8, 12, 0, 21, 0, 0, 0, 1, 0, 0]
    private let Dbmajor = [-1, 0, 13, 18, 23, 0, 1, 1, 4, 0, 0]
    private let Dmajor  = [-1, -1, 0, 17, 23, 27, 0, 0, 1, 0, 0]
    private let Ebmajor = [-1, 0, 13, 18, 23, 0, 1, 1, 6, 0, 0]
    private let Emajor  = [0, 7, 12, 16, 0, 0, 0, 0, 1, 0, 0]
    private let Fmajor  = [0, 8, 13, 17, 0, 0, 1, 1, 1, 0, 0]
    private let Gbmajor = [0, 9, 14, 18, 0, 0, 1, 2, 1, 0, 0]
    private let Gmajor  = [3, 7, 0, 0, 0, 28, 0, 0, 1, 0, 0]
    private let Abmajor = [0, 8, 13, 17, 0, 0, 1, 1, 4, 0, 0]
    
    private let Aminor  = [-1, 0, 12, 17, 21, 0, 0, 0, 1, 0, 0]
    private let Bbminor = [-1, 0, 13, 18, 22, 0, 1, 1, 1, 0, 0]
    private let Bminor  = [-1, 0, 14, 19, 23, 0, 1, 2, 1, 0, 0]
    private let Cminor  = [-1, 0, 15, 20, 24, 0, 1, 3, 1, 0, 0]
    private let Dbminor = [-1, 0, 13, 18, 22, 0, 1, 1, 4, 0, 0]
    private let Dminor  = [-1, -1, 0, 17, 23, 26, 0, 0, 1, 0, 0]
    private let Ebminor = [-1, 0, 14, 19, 23, 0, 1, 2, 5, 0, 0]
    private let Eminor  = [0, 7, 12, 0, 0, 0, 0, 0, 1, 0, 0]
    private let Fminor  = [0, 8, 13, 0, 0, 0, 1, 1, 1, 0, 0]
    private let Gbminor = [0, 9, 14, 0, 0, 0, 1, 2, 1, 0, 0]
    private let Gminor  = [0, 10, 15, 0, 0, 0, 1, 3, 1, 0, 0]
    private let Abminor = [0, 8, 13, 0, 0, 0, 1, 1, 4, 0, 0]
    
    private let inactive = [0]
    
    func chordConstitution(for note: String) -> [Int] {
        switch note {
        case "A":
            return Amajor
        case "A#", "Bb":
            return Bbmajor
        case "B":
            return Bmajor
        case "C":
            return Cmajor
        case "C#", "Db":
            return Dbmajor
        case "D":
            return Dmajor
        case "D#", "Eb":
            return Ebmajor
        case "E":
            return Emajor
        case "F":
            return Fmajor
        case "F#", "Gb":
            return Gbmajor
        case "G":
            return Gmajor
        case "G#", "Ab":
            return Abmajor
        // MARK: - Minors
        case "Am":
            return Aminor
        case "A#m", "Bbm":
            return Bbminor
        case "Bm":
            return Bbminor
        case "Cm":
            return Cminor
        case "C#m", "Dbm":
            return Dbminor
        case "Dm":
            return Dminor
        case "D#m", "Ebm":
            return Ebminor
        case "Em":
            return Ebminor
        case "Fm":
            return Fminor
        case "F#m", "Gbm":
            return Gbminor
        case "Gm":
            return Gbminor
        case "G#m", "Abm":
            return Abminor
        default:
            return inactive
        }
    }
}
