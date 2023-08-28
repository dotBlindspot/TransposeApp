//
//  ChordBuilderInteractor.swift
//  TransposeApp
//
//  Created by Janco Erasmus on 2021/06/14.
//  Copyright © 2021 Janco Erasmus. All rights reserved.
//

import Foundation
//import FirebaseFirestore
//import FirebaseFirestoreSwift

struct ChordModelStructure: Codable {
    var name: String?
    var structure: [Int]?
    var isBarChord: Bool?
    var barFretNumber: Int?
    var startingFretNumber: Int?
    var isCapoOn: Bool?
    var capoFretNumber: Int?
}

struct ChordModels: Codable {
    var chords: [ChordModelStructure]?
    
    enum CodingKeys: String, CodingKey {
        case chords = "Chords"
    }
}

class ChordBuilderInteractor {
    
//    var firestore: Firestore!
    private var selectedNote: String!
    var chords = [ChordModelStructure]()
    
    init() {
//        let settings = FirestoreSettings()
//        settings.isPersistenceEnabled = true
//        settings.cacheSizeBytes = FirestoreCacheSizeUnlimited
//
//        firestore = Firestore.firestore()
//        firestore.settings = settings
    }
    
    func fetchChordPack(note: String,
                        success: @escaping (_ chordModel: [ChordModelStructure]) -> Void,
                        failure: @escaping (_ error: String) -> Void) {
        selectedNote = note
//        let firestoreReference = firestore
//            .collection("ChordPacks")
//            .document(chordPackName)
//            .collection("Chords")
        
//        firestoreReference.addSnapshotListener(includeMetadataChanges: true) { (querySnapshot, error) in
//            
//            guard error == nil else {
//                failure("Could not find ChordPack")
//                return
//            }
//            
//            guard let snapshot = querySnapshot else {
//                failure("Database query error")
//                return
//            }
//            
//            for diff in snapshot.documentChanges {
//                if diff.type == .added {
//                    try? self.chords.append(diff.document.data(as: ChordModelStructure.self)!)
//                }
//            }
//            
//            if self.chords.isEmpty {
//                failure("No Chords found")
//            } else {
//                success(self.chords)
//            }
//        }
        
        //        firestoreReference.getDocuments { (snapshot, error) in
        //            if let snapshot = snapshot {
        //                let chordModels = snapshot.documents
        //                for chordModel in chordModels {
        //                    try? self.chords.append(chordModel.data(as: ChordModelStructure.self)!)
        //                }
        //                success(self.chords)
        //            } else {
        //                failure(error!.localizedDescription)
        //            }
        //        }
    }
    
    func addChordPack(pathName: ChordPackNames,
                      chordPack: [ChordModelStructure]) {
        var count = 1
        for chord in chordPack {
            do {
//                try firestore.collection("ChordPacks").document(pathName.rawValue).collection("Chords").document("\(count)").setData(from: chord)
            } catch {
                print("FAILED WRITE TO!!")
            }
            count += 1
        }
        
    }
    
}

extension ChordBuilderInteractor {
    var chordPackName: String {
        switch selectedNote {
        case "A":
            return ChordPackNames.Amajor.rawValue
        case "A#", "Bb":
            return ChordPackNames.ASharpMajor.rawValue
        case "B":
            return ChordPackNames.Bmajor.rawValue
        case "C":
            return ChordPackNames.Cmajor.rawValue
        case "C#", "Db":
            return ChordPackNames.CSharpMajor.rawValue
        case "D":
            return ChordPackNames.Dmajor.rawValue
        case "D#", "Eb":
            return ChordPackNames.DSharpMajor.rawValue
        case "E":
            return ChordPackNames.Emajor.rawValue
        case "F":
            return ChordPackNames.Fmajor.rawValue
        case "F#", "Gb":
            return ChordPackNames.FSharpMajor.rawValue
        case "G":
            return ChordPackNames.Gmajor.rawValue
        case "G#", "Ab":
            return ChordPackNames.GSharpMajor.rawValue
        // MARK: - Minors
        case "Am":
            return ChordPackNames.Aminor.rawValue
        case "A#m", "Bbm":
            return ChordPackNames.ASharpMinor.rawValue
        case "Bm":
            return ChordPackNames.Bminor.rawValue
        case "Cm":
            return ChordPackNames.Cminor.rawValue
        case "C#m", "Dbm":
            return ChordPackNames.CSharpMinor.rawValue
        case "Dm":
            return ChordPackNames.Dminor.rawValue
        case "D#m", "Ebm":
            return ChordPackNames.DSharpMinor.rawValue
        case "Em":
            return ChordPackNames.Eminor.rawValue
        case "Fm":
            return ChordPackNames.Fminor.rawValue
        case "F#m", "Gbm":
            return ChordPackNames.FSharpMinor.rawValue
        case "Gm":
            return ChordPackNames.Gminor.rawValue
        case "G#m", "Abm":
            return ChordPackNames.GSharpMinor.rawValue
        default:
            return "Default"
        }
    }
}
