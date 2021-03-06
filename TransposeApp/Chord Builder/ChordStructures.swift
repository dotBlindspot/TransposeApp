//
//  ChordStructures.swift
//  TransposeApp
//
//  Created by Janco Erasmus on 2021/06/17.
//  Copyright © 2021 Janco Erasmus. All rights reserved.
//

import Foundation

struct FirestoreChordModel {
    var name: ChordPackNames
    var chordPack: [ChordModelStructure]
}

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
    
    // MARK: - A# Major
    
    static var ASharpMajorChordStructurePack: [ChordModelStructure] {
        let chordPackName = "A# Major"
        
        let ASharpOne = ChordModelStructure(name: chordPackName,
                                            structure: [-1, 0, 13, 18, 23, 0],
                                            isBarChord: true, barFretNumber: 1,
                                            startingFretNumber: 1,
                                            isCapoOn: false, capoFretNumber: 0)
        
        return [ASharpOne]
    }
    
    // MARK: - B Major
    
    static var BmajorChordStructurePack: [ChordModelStructure] {
        let chordPackName = "B Major"
        
        let BOne = ChordModelStructure(name: chordPackName,
                                       structure: [-1, 0, 14, 19, 24, 0],
                                       isBarChord: true, barFretNumber: 2,
                                       startingFretNumber: 1,
                                       isCapoOn: false, capoFretNumber: 0)
        
        return [BOne]
    }
    
    // MARK: - C Major
    
    static var CmajorChordStructurePack: [ChordModelStructure] {
        let chordPackName = "C Major"
        
        let COne = ChordModelStructure(name: chordPackName,
                                       structure: [-1, 8, 12, 0, 21, 0],
                                       isBarChord: false, barFretNumber: 0,
                                       startingFretNumber: 1,
                                       isCapoOn: false, capoFretNumber: 0)
        
        let CAdd9 = ChordModelStructure(name: chordPackName,
                                        structure: [3, 7, 0, 0, 23, 28],
                                        isBarChord: false, barFretNumber: 0,
                                        startingFretNumber: 1,
                                        isCapoOn: false, capoFretNumber: 0)
        
        let CBar = ChordModelStructure(name: chordPackName,
                                       structure: [-1, 8, 15, 20, 25, 0],
                                       isBarChord: true, barFretNumber: 3,
                                       startingFretNumber: 1,
                                       isCapoOn: false, capoFretNumber: 0)
        
        return [COne, CAdd9, CBar]
    }
    
    // MARK: - C# Major
    
    static var CSharpMajorChordStructurePack: [ChordModelStructure] {
        let chordPackName = "C# Major"
        
        let CSharpOne = ChordModelStructure(name: chordPackName,
                                            structure: [-1, 0, 13, 18, 23, 0],
                                            isBarChord: true, barFretNumber: 1,
                                            startingFretNumber: 4,
                                            isCapoOn: false, capoFretNumber: 0)
        
        return [CSharpOne]
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
    
    // MARK: - D# Major
    
    static var DSharpMajorChordStructurePack: [ChordModelStructure] {
        let chordPackName = "D# Major"
        
        let DSharpOne = ChordModelStructure(name: chordPackName,
                                            structure: [-1, 0, 13, 18, 23, 0],
                                            isBarChord: true, barFretNumber: 1,
                                            startingFretNumber: 6,
                                            isCapoOn: false, capoFretNumber: 0)
        
        return [DSharpOne]
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
    
    // MARK: - F Major
    
    static var FMajorChordStructurePack: [ChordModelStructure] {
        let chordPackName = "F Major"
        
        let FOne = ChordModelStructure(name: chordPackName,
                                       structure: [1, 0, 13, 17, 21, -1],
                                       isBarChord: false, barFretNumber: 1,
                                       startingFretNumber: 1,
                                       isCapoOn: false, capoFretNumber: 0)
        
        let FBar = ChordModelStructure(name: chordPackName,
                                       structure: [0, 8, 13, 17, 0, 0],
                                       isBarChord: true, barFretNumber: 1,
                                       startingFretNumber: 1,
                                       isCapoOn: false, capoFretNumber: 0)
        
        return [FOne, FBar]
    }
    
    // MARK: - F# Major
    
    static var FSharpMajorChordStructurePack: [ChordModelStructure] {
        let chordPackName = "F# Major"
        
        let FSharpOne = ChordModelStructure(name: chordPackName,
                                            structure: [0, 9, 14, 18, 0, 0],
                                            isBarChord: true, barFretNumber: 2,
                                            startingFretNumber: 1,
                                            isCapoOn: false, capoFretNumber: 0)
        return [FSharpOne]
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
    
    // MARK: - G# Major
    
    static var GSharpMajorChordStructurePack: [ChordModelStructure] {
        let chordPackName = "G# Major"
        
        let GSharpOne = ChordModelStructure(name: chordPackName,
                                            structure: [0, 8, 13, 17, 0, 0],
                                            isBarChord: true, barFretNumber: 1,
                                            startingFretNumber: 4,
                                            isCapoOn: false, capoFretNumber: 0)
        return [GSharpOne]
    }
    
    // MARK: - A Minor
    static var AminorChordStructurePack: [ChordModelStructure] {
        let chordPackName = "A Minor"
        
        let one = ChordModelStructure(name: chordPackName,
                                      structure: [0, 0, 12, 17, 21, 0],
                                      isBarChord: false, barFretNumber: 0,
                                      startingFretNumber: 1,
                                      isCapoOn: false, capoFretNumber: 0)
        
        let bar = ChordModelStructure(name: chordPackName,
                                      structure: [0, 8, 13, 0, 0, 0],
                                      isBarChord: true, barFretNumber: 1,
                                      startingFretNumber: 5,
                                      isCapoOn: false, capoFretNumber: 0)
        
        return [one, bar]
    }
    
    // MARK: - A# Minor
    static var ASharpMinorChordStructurePack: [ChordModelStructure] {
        let chordPackName = "A# Minor"
        
        let one = ChordModelStructure(name: chordPackName,
                                      structure: [0, 0, 13, 18, 22, 0],
                                      isBarChord: true, barFretNumber: 1,
                                      startingFretNumber: 1,
                                      isCapoOn: false, capoFretNumber: 0)
        
        let two = ChordModelStructure(name: chordPackName,
                                      structure: [0, 9, 14, 0, 0, 0],
                                      isBarChord: true, barFretNumber: 2,
                                      startingFretNumber: 5,
                                      isCapoOn: false, capoFretNumber: 0)
        
        return [one, two]
    }
    
    // MARK: - B Minor
    static var BminorChordStructurePack: [ChordModelStructure] {
        let chordPackName = "B Minor"
        
        let one = ChordModelStructure(name: chordPackName,
                                      structure: [-1, 7, 19, 23, 27, 0],
                                      isBarChord: false, barFretNumber: 0,
                                      startingFretNumber: 1,
                                      isCapoOn: false, capoFretNumber: 0)
        
        let bar = ChordModelStructure(name: chordPackName,
                                      structure: [0, 0, 14, 19, 23, 0],
                                      isBarChord: true, barFretNumber: 2,
                                      startingFretNumber: 1,
                                      isCapoOn: false, capoFretNumber: 0)
        
        return [one, bar]
    }
    
    // MARK: - C Minor
    static var CminorChordStructurePack: [ChordModelStructure] {
        let chordPackName = "C Minor"
        
        let one = ChordModelStructure(name: chordPackName,
                                      structure: [-1, 8, 11, 0, 24, 28],
                                      isBarChord: false, barFretNumber: 0,
                                      startingFretNumber: 1,
                                      isCapoOn: false, capoFretNumber: 0)
        
        let bar = ChordModelStructure(name: chordPackName,
                                      structure: [-1, 0, 15, 20, 24, 0],
                                      isBarChord: true, barFretNumber: 3,
                                      startingFretNumber: 1,
                                      isCapoOn: false, capoFretNumber: 0)
        
        return [one, bar]
    }
    
    // MARK: - C# Minor
    static var CSharpMinorChordStructurePack: [ChordModelStructure] {
        let chordPackName = "C# Minor"
        
        let one = ChordModelStructure(name: chordPackName,
                                      structure: [-1, 9, 12, 16, -1, -1],
                                      isBarChord: false, barFretNumber: 0,
                                      startingFretNumber: 1,
                                      isCapoOn: false, capoFretNumber: 0)
        
        let bar = ChordModelStructure(name: chordPackName,
                                      structure: [-1, 0, 13, 18, 22, 0],
                                      isBarChord: true, barFretNumber: 1,
                                      startingFretNumber: 4,
                                      isCapoOn: false, capoFretNumber: 0)
        
        return [one, bar]
    }
    
    // MARK: - D Minor
    static var DminorChordStructurePack: [ChordModelStructure] {
        let chordPackName = "D Minor"
        
        let one = ChordModelStructure(name: chordPackName,
                                      structure: [-1, -1, 0, 17, 23, 26],
                                      isBarChord: false, barFretNumber: 0,
                                      startingFretNumber: 1,
                                      isCapoOn: false, capoFretNumber: 0)
        
        let bar = ChordModelStructure(name: chordPackName,
                                      structure: [-1, 0, 13, 18, 22, 0],
                                      isBarChord: true, barFretNumber: 1,
                                      startingFretNumber: 5,
                                      isCapoOn: false, capoFretNumber: 0)
        
        return [one, bar]
    }
    
    // MARK: - D# Minor
    static var DSharpMinorChordStructurePack: [ChordModelStructure] {
        let chordPackName = "D# Minor"
        
        let one = ChordModelStructure(name: chordPackName,
                                      structure: [-1, -1, 11, 18, 24, 27],
                                      isBarChord: false, barFretNumber: 0,
                                      startingFretNumber: 1,
                                      isCapoOn: false, capoFretNumber: 0)
        
        let bar = ChordModelStructure(name: chordPackName,
                                      structure: [-1, 0, 13, 18, 22, 0],
                                      isBarChord: true, barFretNumber: 1,
                                      startingFretNumber: 6,
                                      isCapoOn: false, capoFretNumber: 0)
        
        return [one, bar]
    }
    
    // MARK: - E Minor
    static var EminorChordStructurePack: [ChordModelStructure] {
        let chordPackName = "E Minor"
        
        let one = ChordModelStructure(name: chordPackName,
                                      structure: [0, 7, 12, 0, 0, 0],
                                      isBarChord: false, barFretNumber: 0,
                                      startingFretNumber: 1,
                                      isCapoOn: false, capoFretNumber: 0)
        
        let two = ChordModelStructure(name: chordPackName,
                                      structure: [0, 7, 12, 0, 0, 28],
                                      isBarChord: false, barFretNumber: 0,
                                      startingFretNumber: 1,
                                      isCapoOn: false, capoFretNumber: 0)
        
        let three = ChordModelStructure(name: chordPackName,
                                        structure: [0, 7, 12, 0, 23, 28],
                                        isBarChord: false, barFretNumber: 0,
                                        startingFretNumber: 1,
                                        isCapoOn: false, capoFretNumber: 0)
        
        
        let bar = ChordModelStructure(name: chordPackName,
                                      structure: [-1, 0, 13, 18, 22, 0],
                                      isBarChord: true, barFretNumber: 1,
                                      startingFretNumber: 7,
                                      isCapoOn: false, capoFretNumber: 0)
        
        return [one, two, three, bar]
    }
    
    // MARK: - F Minor
    static var FminorChordStructurePack: [ChordModelStructure] {
        let chordPackName = "F Minor"
        
        let one = ChordModelStructure(name: chordPackName,
                                      structure: [-1, -1, 11, 18, 24, 27],
                                      isBarChord: false, barFretNumber: 0,
                                      startingFretNumber: 3,
                                      isCapoOn: false, capoFretNumber: 0)
        
        
        let bar = ChordModelStructure(name: chordPackName,
                                      structure: [0, 8, 13, 0, 0, 0],
                                      isBarChord: true, barFretNumber: 1,
                                      startingFretNumber: 1,
                                      isCapoOn: false, capoFretNumber: 0)
        
        return [one, bar]
    }
    
    // MARK: - F# Minor
    static var FSharpMinorChordStructurePack: [ChordModelStructure] {
        let chordPackName = "F# Minor"
        
        let one = ChordModelStructure(name: chordPackName,
                                      structure: [-1, -1, 11, 18, 24, 27],
                                      isBarChord: false, barFretNumber: 0,
                                      startingFretNumber: 4,
                                      isCapoOn: false, capoFretNumber: 0)
        #warning("Fix Fret board numebr - not resetting")
        let bar = ChordModelStructure(name: chordPackName,
                                      structure: [0, 9, 14, 0, 0, 0],
                                      isBarChord: true, barFretNumber: 2,
                                      startingFretNumber: 1,
                                      isCapoOn: false, capoFretNumber: 0)
        
        return [one, bar]
    }
    
    // MARK: - G Minor
    static var GminorChordStructurePack: [ChordModelStructure] {
        let chordPackName = "G Minor"
        
        let one = ChordModelStructure(name: chordPackName,
                                      structure: [3, 6, 0, 0, 23, 28],
                                      isBarChord: false, barFretNumber: 0,
                                      startingFretNumber: 3,
                                      isCapoOn: false, capoFretNumber: 0)
        
        
        let bar = ChordModelStructure(name: chordPackName,
                                      structure: [0, 10, 15, 0, 0, 0],
                                      isBarChord: true, barFretNumber: 3,
                                      startingFretNumber: 1,
                                      isCapoOn: false, capoFretNumber: 0)
        
        return [one, bar]
    }
    
    // MARK: - G# Minor
    static var GSharpMinorChordStructurePack: [ChordModelStructure] {
        let chordPackName = "G# Minor"
        
        let one = ChordModelStructure(name: chordPackName,
                                      structure: [4, 7, 11, 16, -1, -1],
                                      isBarChord: false, barFretNumber: 0,
                                      startingFretNumber: 1,
                                      isCapoOn: false, capoFretNumber: 0)
        
        let bar = ChordModelStructure(name: chordPackName,
                                      structure: [0, 8, 13, 0, 0, 0],
                                      isBarChord: true, barFretNumber: 1,
                                      startingFretNumber: 4,
                                      isCapoOn: false, capoFretNumber: 0)
        
        return [one, bar]
    }
    
    static var firestoreModelPack: [FirestoreChordModel] {
        return [FirestoreChordModel(name: .Amajor, chordPack: AmajorChordStructurePack),
                FirestoreChordModel(name: .ASharpMajor, chordPack: ASharpMajorChordStructurePack),
                FirestoreChordModel(name: .Bmajor, chordPack: BmajorChordStructurePack),
                FirestoreChordModel(name: .Cmajor, chordPack: CmajorChordStructurePack),
                FirestoreChordModel(name: .CSharpMajor, chordPack: CSharpMajorChordStructurePack),
                FirestoreChordModel(name: .Dmajor, chordPack: DmajorChordStructurePack),
                FirestoreChordModel(name: .DSharpMajor, chordPack: DSharpMajorChordStructurePack),
                FirestoreChordModel(name: .Emajor, chordPack: EmajorChordStructurePack),
                FirestoreChordModel(name: .Fmajor, chordPack: FMajorChordStructurePack),
                FirestoreChordModel(name: .FSharpMajor, chordPack: FSharpMajorChordStructurePack),
                FirestoreChordModel(name: .Gmajor, chordPack: GmajorChordStructurePack),
                FirestoreChordModel(name: .GSharpMajor, chordPack: GSharpMajorChordStructurePack),
                FirestoreChordModel(name: .Aminor, chordPack: AminorChordStructurePack),
                FirestoreChordModel(name: .ASharpMinor, chordPack: ASharpMinorChordStructurePack),
                FirestoreChordModel(name: .Bminor, chordPack: BminorChordStructurePack),
                FirestoreChordModel(name: .Cminor, chordPack: CminorChordStructurePack),
                FirestoreChordModel(name: .CSharpMinor, chordPack: CSharpMinorChordStructurePack),
                FirestoreChordModel(name: .Dminor, chordPack: DminorChordStructurePack),
                FirestoreChordModel(name: .DSharpMinor, chordPack: DSharpMinorChordStructurePack),
                FirestoreChordModel(name: .Eminor, chordPack: EminorChordStructurePack),
                FirestoreChordModel(name: .Fminor, chordPack: FminorChordStructurePack),
                FirestoreChordModel(name: .FSharpMinor, chordPack: FSharpMinorChordStructurePack),
                FirestoreChordModel(name: .Gminor, chordPack: GminorChordStructurePack),
                FirestoreChordModel(name: .GSharpMinor, chordPack: GSharpMinorChordStructurePack)]
    }
}
/*
 Am
 Em
 Dm
 Bm
 csm
 fsm
 */
