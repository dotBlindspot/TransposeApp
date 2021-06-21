//
//  ChordStructures.swift
//  TransposeApp
//
//  Created by Janco Erasmus on 2021/06/17.
//  Copyright © 2021 Janco Erasmus. All rights reserved.
//

import Foundation

struct ChordStructures {
        
    // MARK: - A Major
    static var AmajorChordStructurePack: [ChordModelStructure] {
        let chordPackName = "A Major Chord"
        
        let AOne = ChordModelStructure(name: chordPackName,
                                       structure: [-1, 0, 12, 17, 22, 0],
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
        
        return [AOne, ATwo, AThree, ABar]
    }
    
    // MARK: - C Major
    static var CmajorChordStructurePack: [ChordModelStructure] {
        let chordPackName = "C Major Chord"
        
        let COne = ChordModelStructure(name: chordPackName,
                                       structure: [-1, 0, 12, 17, 22, 0],
                                       isBarChord: false, barFretNumber: 0,
                                       startingFretNumber: 1,
                                       isCapoOn: false, capoFretNumber: 0)
        
        let CTwo = ChordModelStructure(name: chordPackName,
                                       structure: [-1, 0, 12, 17, 22, 30],
                                       isBarChord: false, barFretNumber: 0,
                                       startingFretNumber: 1,
                                       isCapoOn: false, capoFretNumber: 0)
        
        let CThree = ChordModelStructure(name: chordPackName,
                                         structure: [5, 9, 12, 17, 22, 30],
                                         isBarChord: false, barFretNumber: 0,
                                         startingFretNumber: 1,
                                         isCapoOn: false, capoFretNumber: 0)
        
        let CBar = ChordModelStructure(name: chordPackName,
                                       structure: [1, 8, 13, 17, 21, 26],
                                       isBarChord: true, barFretNumber: 1,
                                       startingFretNumber: 5,
                                       isCapoOn: false, capoFretNumber: 0)
        
        return [COne, CTwo, CThree, CBar]
    }
    
    // MARK: - G Major
    static var GmajorChordStructurePack: [ChordModelStructure] {
        let chordPackName = "G Major Chord"
        
        let GOne = ChordModelStructure(name: chordPackName,
                                       structure: [-1, 0, 12, 17, 22, 0],
                                       isBarChord: false, barFretNumber: 0,
                                       startingFretNumber: 1,
                                       isCapoOn: false, capoFretNumber: 0)
        
        let GTwo = ChordModelStructure(name: chordPackName,
                                       structure: [-1, 0, 12, 17, 22, 30],
                                       isBarChord: false, barFretNumber: 0,
                                       startingFretNumber: 1,
                                       isCapoOn: false, capoFretNumber: 0)
        
        let GThree = ChordModelStructure(name: chordPackName,
                                         structure: [5, 9, 12, 17, 22, 30],
                                         isBarChord: false, barFretNumber: 0,
                                         startingFretNumber: 1,
                                         isCapoOn: false, capoFretNumber: 0)
        
        let GBar = ChordModelStructure(name: chordPackName,
                                       structure: [1, 8, 13, 17, 21, 26],
                                       isBarChord: true, barFretNumber: 1,
                                       startingFretNumber: 5,
                                       isCapoOn: false, capoFretNumber: 0)
        
        return [GOne, GTwo, GThree, GBar]
    }
}
