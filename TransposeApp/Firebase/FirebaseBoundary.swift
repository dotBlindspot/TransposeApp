//
//  FirebaseBoundary.swift
//  TransposeApp
//
//  Created by Janco Erasmus on 2021/03/17.
//  Copyright © 2021 Janco Erasmus. All rights reserved.
//

import Foundation
import Firebase

typealias EmptySuccessResponse = () -> Void
typealias FirebaseFailedRequest = (_ : String) -> Void

protocol FirebaseBoundary {
    var reference: DatabaseReference { get set }
    func fetchFeatureToggle(success: @escaping EmptySuccessResponse,
                            failure: @escaping FirebaseFailedRequest)
}
