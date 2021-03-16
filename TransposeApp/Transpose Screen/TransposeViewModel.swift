//
//  TransposeViewModel.swift
//  TransposeApp
//
//  Created by Janco Erasmus on 2021/03/10.
//  Copyright © 2021 Janco Erasmus. All rights reserved.
//

import Foundation

class TransposeViewModel: Staffable {
    
    private var _requestType: TransposeRequestType = Cache().requestType
    private var fromNumber: Int = 0
    private var toNumber: Int = 0
    
    var requestType: TransposeRequestType {
        get {
            _requestType
        }
        set {
            _requestType = newValue
        }
    }
    
    var isRequestTypeKeys: Bool {
        return requestType == .keys
    }
    
    var fretNumber: Int {
        guard toNumber > 0 && fromNumber != toNumber else { return 0 }
        let numericDifference = fromNumber - toNumber
        return numericDifference > 0 ? numericDifference : numericDifference + 12
    }
    
    func requestScale(fromNote: Int, toNote: Int) -> [String] {
        setNoteNumberValues(fromNote: fromNote, toNote: toNote)
        return isRequestTypeKeys ? requestTransposedScale(fromNote: fromNote, toNote: toNote) : scaleOf(toNote)
    }
    
    func requestTransposedScale(fromNote: Int, toNote: Int) -> [String] {
        let transposedNote = toNote - fromNote
        return scaleOf(transposedNote + fromNote)
    }
    
    private func setNoteNumberValues(fromNote: Int, toNote: Int) {
        self.fromNumber = fromNote
        self.toNumber = toNote
    }
}
