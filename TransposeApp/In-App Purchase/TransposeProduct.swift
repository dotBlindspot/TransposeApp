//
//  TransposeProduct.swift
//  TransposeApp
//
//  Created by Janco Erasmus on 2021/03/17.
//  Copyright © 2021 Janco Erasmus. All rights reserved.
//

import Foundation

public struct TransposeProduct {
    public static let SwiftShoppingProductID = "com.jancoera.buyTransposeApp"
    public static let productIdentifiers: Set<ProductIdentifier> = [TransposeProduct.SwiftShoppingProductID]
    public static let store = InAppPurchaseHelper(productIdentifiers: TransposeProduct.productIdentifiers)
}

func resourceName(for productIdentifier: String) -> String? {
    return productIdentifier.components(separatedBy: ".").last
}
