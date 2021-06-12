//
//  ChordBuilder.swift
//  TransposeApp
//
//  Created by Janco Erasmus on 2021/03/24.
//  Copyright © 2021 Janco Erasmus. All rights reserved.
//

/*
 struct ChordStructureModel {
     var structure: [Int]
     var isBarChord: Bool
     var barFretNumber: Int
     var startingFretNumber: Int
     var isCapoOn: Bool
     var capoFretNumber: Int
 }

 struct ChordBuilder {
     
     /// Structure layout - [E, A, D, G, B, E, BarChord - Bool (0), Bar Fret Number, First Fret Number, Capo On, Capo Number]
     /// String numbers: -1 String should not be played (X displayed on neckBar)
     ///             0  Open String
     /// Bar Chord: 0 represent false then normal open chord & 1 represent true then finger like component displayed
     /// First Fret Number: Allows to display which fret number are used
     /// Capo On: Display another chord in diffrent key that represent the same chord with Capo On (A can be G chord with Capo 2)
     
     private let Amajor = ChordStructureModel(structure: [-1, 0, 12, 17, 22, 0],
                                              isBarChord: false, barFretNumber: 0,
                                              startingFretNumber: 1,
                                              isCapoOn: false, capoFretNumber: 0)
     
     private let AmajorShape2 = ChordStructureModel(structure: [-1, 0, 12, 17, 22, 30],
                                                    isBarChord: false, barFretNumber: 0,
                                                    startingFretNumber: 1,
                                                    isCapoOn: false, capoFretNumber: 0)
     private let AmajorShape3 = ChordStructureModel(structure: [5, 9, 12, 17, 22, 30],
                                                   isBarChord: false, barFretNumber: 0,
                                                   startingFretNumber: 1,
                                                   isCapoOn: false, capoFretNumber: 0)
     
     private let AmajorBarChord = ChordStructureModel(structure: [1, 8, 13, 17, 21, 26],
                                                      isBarChord: true, barFretNumber: 1,
                                                      startingFretNumber: 5,
                                                      isCapoOn: false, capoFretNumber: 0)
 */

import Foundation

struct ChordPack {
    var name: String
    var chords: [ChordModel]
}

struct ChordModel {
    var structure: [Int]
    var isBarChord: Bool
    var barFretNumber: Int
    var startingFretNumber: Int
    var isCapoOn: Bool
    var capoFretNumber: Int
}

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
    
    // MARK: Using Chord Packs ( Add here )
    
    // MARK: Amajor Chord Models
    private var AmajorShapeOne: ChordModel {
        return ChordModel(structure: [-1, 0, 12, 17, 22, 0],
                          isBarChord: false, barFretNumber: 0,
                          startingFretNumber: 1,
                          isCapoOn: false, capoFretNumber: 0)
    }
    
    private var AmajorShapeTwo: ChordModel {
        return ChordModel(structure: [-1, 0, 12, 17, 22, 30],
                          isBarChord: false, barFretNumber: 0,
                          startingFretNumber: 1,
                          isCapoOn: false, capoFretNumber: 0)
    }
    
    private var AmajorShapeThree: ChordModel {
        return ChordModel(structure: [5, 9, 12, 17, 22, 30],
                          isBarChord: false, barFretNumber: 0,
                          startingFretNumber: 1,
                          isCapoOn: false, capoFretNumber: 0)
    }
    
    private var AmajorBarChord: ChordModel {
        return ChordModel(structure: [1, 8, 13, 17, 21, 26],
                          isBarChord: true, barFretNumber: 1,
                          startingFretNumber: 5,
                          isCapoOn: false, capoFretNumber: 0)
    }
    
    private var AmajorChords: [ChordModel] {
        return [AmajorShapeOne, AmajorBarChord, AmajorShapeTwo, AmajorShapeThree]
    }
    
    // MARK: Gmajor Chord Models
    
    private var GmajorOne: ChordModel {
        return ChordModel(structure: [3, 7, 0, 0, 0, 28],
                          isBarChord: false, barFretNumber: 0,
                          startingFretNumber: 1,
                          isCapoOn: false, capoFretNumber: 0)
    }
    
    private var GmajorBarChord: ChordModel {
        return ChordModel(structure: [0, 10, 15, 19, 0, 0],
                          isBarChord: true, barFretNumber: 3,
                          startingFretNumber: 1,
                          isCapoOn: false, capoFretNumber: 0)
    }
    
    private var GmajorChords: [ChordModel] {
        return [GmajorOne, GmajorBarChord]
    }
    
    func chordPack(for note: String) -> ChordPack {
        switch note {
        case "A":
            return ChordPack(name: "Amajor", chords: AmajorChords)
        case "A#", "Bb":
            return ChordPack(name: "Amajor", chords: AmajorChords)
        case "B":
            return ChordPack(name: "Amajor", chords: AmajorChords)
        case "C":
            return ChordPack(name: "Amajor", chords: AmajorChords)
        case "C#", "Db":
            return ChordPack(name: "Amajor", chords: AmajorChords)
        case "D":
            return ChordPack(name: "Amajor", chords: AmajorChords)
        case "D#", "Eb":
            return ChordPack(name: "Amajor", chords: AmajorChords)
        case "E":
            return ChordPack(name: "Amajor", chords: AmajorChords)
        case "F":
            return ChordPack(name: "Amajor", chords: AmajorChords)
        case "F#", "Gb":
            return ChordPack(name: "Amajor", chords: AmajorChords)
        case "G":
            return ChordPack(name: "Gmajor", chords: GmajorChords)
        case "G#", "Ab":
            return ChordPack(name: "Amajor", chords: AmajorChords)
        // MARK: - Minors
        case "Am":
            return ChordPack(name: "Amajor", chords: AmajorChords)
        case "A#m", "Bbm":
            return ChordPack(name: "Amajor", chords: AmajorChords)
        case "Bm":
            return ChordPack(name: "Amajor", chords: AmajorChords)
        case "Cm":
            return ChordPack(name: "Amajor", chords: AmajorChords)
        case "C#m", "Dbm":
            return ChordPack(name: "Amajor", chords: AmajorChords)
        case "Dm":
            return ChordPack(name: "Amajor", chords: AmajorChords)
        case "D#m", "Ebm":
            return ChordPack(name: "Amajor", chords: AmajorChords)
        case "Em":
            return ChordPack(name: "Amajor", chords: AmajorChords)
        case "Fm":
            return ChordPack(name: "Amajor", chords: AmajorChords)
        case "F#m", "Gbm":
            return ChordPack(name: "Amajor", chords: AmajorChords)
        case "Gm":
            return ChordPack(name: "Amajor", chords: AmajorChords)
        case "G#m", "Abm":
            return ChordPack(name: "Amajor", chords: AmajorChords)
        default:
            return ChordPack(name: "Amajor", chords: AmajorChords)
        }
    }
}
