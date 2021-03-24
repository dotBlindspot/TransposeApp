//
//  UIApplication + Extensions.swift
//  TransposeApp
//
//  Created by Janco Erasmus on 2021/03/24.
//  Copyright © 2021 Janco Erasmus. All rights reserved.
//

import UIKit

extension UIApplication {
    
    static var appEnvironment: String? {
        return Bundle.main.object(forInfoDictionaryKey: "AppEnvironment") as? String
    }
}
