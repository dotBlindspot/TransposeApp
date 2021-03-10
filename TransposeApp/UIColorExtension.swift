//
//  UIColorExtension.swift
//  TransposeApp
//
//  Created by Janco Erasmus on 2019/02/12.
//  Copyright © 2019 Janco Erasmus. All rights reserved.
//

import Foundation
import UIKit

extension UIColor{
    
    static let lightBlueT = UIColor().colorFromHex("277BB3")
    static let darkBlueT  = UIColor().colorFromHex("2C3E50")
    static let llblue = UIColor().colorFromHex("8AB1EB")
    static let lBlue  = UIColor().colorFromHex("5879C1")
    static let dBlue  = UIColor().colorFromHex("394687")
    
    static let invertedBlueT = UIColor().colorFromHex("d8844c")
    
    static let redT = UIColor().colorFromHex("c95a49")
    //static let greenT = UIColor().colorFromHex("009055") 4EB38A
    static let greenT = UIColor().colorFromHex("4EB38A")
    
    //pastel color palette
    static let pastelGreen    = UIColor().colorFromHex("C3E6DE")
    static let pastelRed      = UIColor().colorFromHex("EDCAE1")
    static let pastelYellow   = UIColor().colorFromHex("F8F2DD")
    static let pastelTurqoise = UIColor().colorFromHex("4499A6")
    static let pastelBlue     = UIColor().colorFromHex("1E334D")
    static let pastelOrange   = UIColor().colorFromHex("E3A880")
    
    //blue color palette
    static let darkBlue        = UIColor().colorFromHex("171939")
    static let middleDarkBlue  = UIColor().colorFromHex("394687")
    static let middleBlue      = UIColor().colorFromHex("5879c1")
    static let middleLightBlue = UIColor().colorFromHex("8ab1eb")
    static let lightBlue       = UIColor().colorFromHex("b5d3f4")
    
    //logo blue
    static let logoBlue = UIColor().colorFromHex("4079AD")
    
    //buttonblue
    static let pBlue = UIColor().colorFromHex("ABB8CE")
    
    //light color palette
    static let pGray = UIColor().colorFromHex("EBEBEB")
    
    func colorFromHex(_ hex : String) -> UIColor{
        var hexString = hex.uppercased()
        if hexString.hasPrefix("#"){
            hexString.remove(at: hexString.startIndex)
        }
        
        if hexString.count != 6 {
            return UIColor.black
        }
        
        var rgb : UInt32 = 0
        Scanner(string: hexString).scanHexInt32(&rgb)
        
        return UIColor.init(red: CGFloat((rgb & 0xFF0000) >> 16)/255.0,
                            green: CGFloat((rgb & 0x00FF00) >> 8)/255.0,
                            blue: CGFloat((rgb & 0x0000FF))/255.0,
                            alpha: 1.0)
    }
}

