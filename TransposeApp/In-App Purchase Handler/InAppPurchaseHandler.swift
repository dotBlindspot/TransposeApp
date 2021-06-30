//
//  InAppPurchaseHandler.swift
//  TransposeApp
//
//  Created by Janco Erasmus on 2021/06/29.
//  Copyright © 2021 Janco Erasmus. All rights reserved.
//

import Foundation
import StoreKit

protocol InAppPurchaseHandlerDelegate {
    func productsFetchedSuccessfully()
    func paymentSuccessful(for product: SKProduct)
    func paymentError(error: String)
}

class InAppPurchaseHandler: NSObject {
    
    var removeAdsProduct: SKProduct?
    var delegate: InAppPurchaseHandlerDelegate?
    
    func fetchProducts() {
        let request = SKProductsRequest(productIdentifiers: ["com.jancoerasmus.transposeapp.removeads"])
        request.delegate = self
        request.start()
    }
    
    func makeNewPurchase() {
        guard let removeAdsProduct = removeAdsProduct else {
            return
        }

        if SKPaymentQueue.canMakePayments() {
            let payment = SKPayment(product: removeAdsProduct)
            SKPaymentQueue.default().add(self)
            SKPaymentQueue.default().add(payment)
        }
    }
}

extension InAppPurchaseHandler: SKProductsRequestDelegate {
    
    func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {
        
        if let product = response.products.first {
            removeAdsProduct = product
            delegate?.productsFetchedSuccessfully()
        }
    }
}

extension InAppPurchaseHandler: SKPaymentTransactionObserver {
    
    func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
        for transaction in transactions {
            switch transaction.transactionState {
            case .purchasing:
                break
            case .purchased, .restored:
                // Unlock item
                UserDefaults.standard.set(true, forKey: PurchaseKeys.purchased.rawValue)
                SKPaymentQueue.default().finishTransaction(transaction)
                SKPaymentQueue.default().remove(self)
                delegate?.paymentSuccessful(for: removeAdsProduct!)
            case .failed, .deferred:
                SKPaymentQueue.default().finishTransaction(transaction)
                SKPaymentQueue.default().remove(self)
                delegate?.paymentError(error: "Could not complete purchase")
            default:
                SKPaymentQueue.default().finishTransaction(transaction)
                SKPaymentQueue.default().remove(self)
            }
        }
    }
}

enum PurchaseKeys: String {
    case purchased = "isPurchased"
}
