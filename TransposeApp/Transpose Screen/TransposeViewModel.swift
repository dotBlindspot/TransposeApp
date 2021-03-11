//
//  TransposeViewModel.swift
//  TransposeApp
//
//  Created by Janco Erasmus on 2021/03/10.
//  Copyright © 2021 Janco Erasmus. All rights reserved.
//

import Foundation

struct TransposeViewModel: Staffable {
    
    mutating func reqeustTransposedScale(fromNote: Int, toNote: Int) -> [String] {
        let transposedNote = toNote - fromNote
        return scaleOf(transposedNote + fromNote)
    }
    
    mutating func requestTransposedScaleWithCapoOn(fromNote: Int, fret: Int) -> [String] {
        return scaleOf(fromNote + fret)
    }
}
