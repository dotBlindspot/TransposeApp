//
//  ChordBuilderInteractor.swift
//  TransposeApp
//
//  Created by Janco Erasmus on 2021/06/14.
//  Copyright © 2021 Janco Erasmus. All rights reserved.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

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
    
    var firestore: Firestore!
    private var selectedNote: String!
    var chords = [ChordModelStructure]()
    
    init() {
        let settings = FirestoreSettings()
        settings.isPersistenceEnabled = true
        settings.cacheSizeBytes = FirestoreCacheSizeUnlimited
        
        firestore = Firestore.firestore()
        firestore.settings = settings
    }
    
    func fetchChordPack(for note: String,
                        success: @escaping (_ chordModel: [ChordModelStructure]) -> Void,
                        failure: @escaping (_ error: String) -> Void) {
        selectedNote = note
        let firestoreReference = firestore
            .collection("ChordPacks")
            .document(chordPackName)
            .collection("Chords")
        
        firestoreReference.addSnapshotListener(includeMetadataChanges: true) { (querySnapshot, _) in
            guard let snapshot = querySnapshot else {
                failure("Database query error")
                return
            }
            
            for diff in snapshot.documentChanges {
                if diff.type == .added {
                    try? self.chords.append(diff.document.data(as: ChordModelStructure.self)!)
                }
            }
            
            success(self.chords)
        }
        
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
                try firestore.collection("ChordPacks").document(pathName.rawValue).collection("Chords").document("\(count)").setData(from: chord)
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
            return ""
        case "B":
            return ""
        case "C":
            return ""
        case "C#", "Db":
            return ""
        case "D":
            return ""
        case "D#", "Eb":
            return ""
        case "E":
            return ChordPackNames.Emajor.rawValue
        case "F":
            return ""
        case "F#", "Gb":
            return ""
        case "G":
            return ChordPackNames.Gmajor.rawValue
        case "G#", "Ab":
            return ""
        // MARK: - Minors
        case "Am":
            return ""
        case "A#m", "Bbm":
            return ""
        case "Bm":
            return ""
        case "Cm":
            return ""
        case "C#m", "Dbm":
            return ""
        case "Dm":
            return ""
        case "D#m", "Ebm":
            return ""
        case "Em":
            return ""
        case "Fm":
            return ""
        case "F#m", "Gbm":
            return ""
        case "Gm":
            return ""
        case "G#m", "Abm":
            return ""
        default:
            return ""
        }
    }
}

enum ChordPackNames: String {
    case Amajor = "AmajorChordPack"
    case Emajor = "EmajorChordPack"
    case Gmajor = "GmajorChordPack"
}
