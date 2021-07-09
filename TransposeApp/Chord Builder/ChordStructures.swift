//
//  ChordStructures.swift
//  TransposeApp
//
//  Created by Janco Erasmus on 2021/06/17.
//  Copyright © 2021 Janco Erasmus. All rights reserved.
//

import Foundation

enum ChordPackNames: String {
    case Amajor = "AmajorChordPack"
    case ASharpMajor = "ASharpMajorChordPack"
    
    case Bmajor = "BmajorChordPack"
    
    case Cmajor = "CmajorChordPack"
    case CSharpMajor = "CSharpMajorChordPack"
    
    case Dmajor = "DmajorChordPack"
    case DSharpMajor = "DSharpMajorChordPack"
    
    case Emajor = "EmajorChordPack"
    
    case Fmajor = "FmajorChordPack"
    case FSharpMajor = "FSharpMajorChordPack"
    
    case Gmajor = "GmajorChordPack"
    case GSharpMajor = "GSharpMajorChordPack"
    
    case Aminor = "AminorChordPack"
    case ASharpMinor = "ASharpMinorChordPack"
    
    case Bminor = "BminorChordPack"
    
    case Cminor = "CminorChordPack"
    case CSharpMinor = "CSharpMinorChordPack"
    
    case Dminor = "DminorChordPack"
    case DSharpMinor = "DSharpMinorChordPack"
    
    case Eminor = "EminorChordPack"
    
    case Fminor = "FminorChordPack"
    case FSharpMinor = "FSharpMinorChordPack"
    
    case Gminor = "GminorChordPack"
    case GSharpMinor = "GSharpMinorChordPack"
}

struct ChordStructures {
    
    // MARK: - A Major
    static var AmajorChordStructurePack: [ChordModelStructure] {
        let chordPackName = "A Major"
        
        let AOne = ChordModelStructure(name: chordPackName,
                                       structure: [-1, 0, 12, 17, 22, 0],
                                       isBarChord: false, barFretNumber: 0,
                                       startingFretNumber: 1,
                                       isCapoOn: false, capoFretNumber: 0)
        
        let ASus2 = ChordModelStructure(name: chordPackName,
                                        structure: [-1, 0, 12, 17, 0, 0],
                                        isBarChord: false, barFretNumber: 0,
                                        startingFretNumber: 1,
                                        isCapoOn: false, capoFretNumber: 0)
        
        let ATwo = ChordModelStructure(name: chordPackName,
                                       structure: [-1, 0, 12, 17, 22, 30],
                                       isBarChord: false, barFretNumber: 0,
                                       startingFretNumber: 1,
                                       isCapoOn: false, capoFretNumber: 0)
        
        let AThree = ChordModelStructure(name: chordPackName,
                                         structure: [5, 9, 12, 17, 22, 30],
                                         isBarChord: false, barFretNumber: 0,
                                         startingFretNumber: 1,
                                         isCapoOn: false, capoFretNumber: 0)
        
        let ABar = ChordModelStructure(name: chordPackName,
                                       structure: [1, 8, 13, 17, 21, 26],
                                       isBarChord: true, barFretNumber: 1,
                                       startingFretNumber: 5,
                                       isCapoOn: false, capoFretNumber: 0)
        
        let AFour = ChordModelStructure(name: chordPackName,
                                        structure: [-1, -1, 11, 18, 24, 28],
                                        isBarChord: false, barFretNumber: 0,
                                        startingFretNumber: 7,
                                        isCapoOn: false, capoFretNumber: 0)
        
        let AFive = ChordModelStructure(name: chordPackName,
                                        structure: [-1, 9, 13, 16, 22, 26],
                                        isBarChord: false, barFretNumber: 0,
                                        startingFretNumber: 9,
                                        isCapoOn: false, capoFretNumber: 0)
        
        return [AOne, ASus2, ATwo, AThree, ABar, AFour, AFive]
    }
    
    // MARK: - D Major
    
    static var DmajorChordStructurePack: [ChordModelStructure] {
        let chordPackName = "D Major"
        
        let DOne = ChordModelStructure(name: chordPackName,
                                       structure: [-1, -1, 0, 17, 23, 27],
                                       isBarChord: false, barFretNumber: 0,
                                       startingFretNumber: 1,
                                       isCapoOn: false, capoFretNumber: 0)
        
        let DTwo = ChordModelStructure(name: chordPackName,
                                       structure: [-1, 10, 14, 17, 23, 27],
                                       isBarChord: false, barFretNumber: 0,
                                       startingFretNumber: 1,
                                       isCapoOn: false, capoFretNumber: 0)
        
        let DThree = ChordModelStructure(name: chordPackName,
                                         structure: [4, 8, 11, 16, 21, 29],
                                         isBarChord: false, barFretNumber: 0,
                                         startingFretNumber: 7,
                                         isCapoOn: false, capoFretNumber: 0)
        
        let DBar = ChordModelStructure(name: chordPackName,
                                       structure: [-1, 0, 13, 18, 23, 0],
                                       isBarChord: true, barFretNumber: 1,
                                       startingFretNumber: 5,
                                       isCapoOn: false, capoFretNumber: 0)
        
        return [DOne, DTwo, DThree, DBar]
    }
    
    // MARK: - E Major
    static var EmajorChordStructurePack: [ChordModelStructure] {
        let chordPackName = "E Major"
        
        let EOne = ChordModelStructure(name: chordPackName,
                                       structure: [0, 7, 12, 16, 0, 0],
                                       isBarChord: false, barFretNumber: 0,
                                       startingFretNumber: 1,
                                       isCapoOn: false, capoFretNumber: 0)
        
        let ETwo = ChordModelStructure(name: chordPackName,
                                       structure: [0, 7, 12, 19, 25, 29],
                                       isBarChord: false, barFretNumber: 0,
                                       startingFretNumber: 1,
                                       isCapoOn: false, capoFretNumber: 0)
        
        let EThree = ChordModelStructure(name: chordPackName,
                                         structure: [-1, -1, 12, 16, 0, 29],
                                         isBarChord: false, barFretNumber: 0,
                                         startingFretNumber: 1,
                                         isCapoOn: false, capoFretNumber: 0)
        
        let EBar = ChordModelStructure(name: chordPackName,
                                       structure: [-1, 0, 13, 18, 23, 0],
                                       isBarChord: true, barFretNumber: 1,
                                       startingFretNumber: 7,
                                       isCapoOn: false, capoFretNumber: 0)
        
        return [EOne, ETwo, EThree, EBar]
    }
    
    // MARK: - G Major
    static var GmajorChordStructurePack: [ChordModelStructure] {
        let chordPackName = "G Major"
        
        let GOne = ChordModelStructure(name: chordPackName,
                                       structure: [3, 7, 0, 0, 0, 28],
                                       isBarChord: false, barFretNumber: 0,
                                       startingFretNumber: 1,
                                       isCapoOn: false, capoFretNumber: 0)
        
        let GTwo = ChordModelStructure(name: chordPackName,
                                       structure: [3, 7, 0, 0, 23, 28],
                                       isBarChord: false, barFretNumber: 0,
                                       startingFretNumber: 1,
                                       isCapoOn: false, capoFretNumber: 0)
        
        let GThree = ChordModelStructure(name: chordPackName,
                                         structure: [3, 7, 0, 19, 23, -1],
                                         isBarChord: false, barFretNumber: 0,
                                         startingFretNumber: 1,
                                         isCapoOn: false, capoFretNumber: 0)
        
        let GBar = ChordModelStructure(name: chordPackName,
                                       structure: [0, 10, 15, 19, 0, 0],
                                       isBarChord: true, barFretNumber: 3,
                                       startingFretNumber: 1,
                                       isCapoOn: false, capoFretNumber: 0)
        
        return [GOne, GTwo, GThree, GBar]
    }
}
