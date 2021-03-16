//
//  Cachable.swift
//  TransposeApp
//
//  Created by Janco Erasmus on 2021/03/15.
//  Copyright © 2021 Janco Erasmus. All rights reserved.
//

import Foundation

protocol NoteBankable {
    var noteBank: [String] { get }
}

extension NoteBankable {
    
    var noteBank: [String] {
        return Cache().useSharpNotes ? Cache().sharpNotes : Cache().flatNotes
    }
}
