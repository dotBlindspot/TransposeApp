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
    func restoredSuccessfully()
}

class InAppPurchaseHandler: NSObject {
    static var shared = InAppPurchaseHandler()
    
    var removeAdsProduct: SKProduct?
    var delegate: InAppPurchaseHandlerDelegate?
    
    let removeAdsProductID = "com.jancoerasmus.transposeapp.removeads"
    
    func fetchProducts() {
        let request = SKProductsRequest(productIdentifiers: [removeAdsProductID])
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
        } else {
            delegate?.paymentError(error: "Experiencing some technical errors processing your payment/n/nPlease try again later")
        }
    }
    
    func restorePurchases() {
        if SKPaymentQueue.canMakePayments() {
            SKPaymentQueue.default().add(self)
            SKPaymentQueue.default().restoreCompletedTransactions()
        } else {
            delegate?.paymentError(error: "Experiencing some technical errors processing your payment/n/nPlease try again later")
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
            case .purchased:
                if transaction.payment.productIdentifier == removeAdsProductID {
                    UserDefaults.standard.set(true, forKey: PurchaseKeys.purchased.rawValue)
                }
                UserDefaults.standard.set(true, forKey: FlyerName.removeAds.rawValue)
                SKPaymentQueue.default().finishTransaction(transaction)
                SKPaymentQueue.default().remove(self)
                delegate?.paymentSuccessful(for: removeAdsProduct!)
            case .restored:
                if transaction.payment.productIdentifier == removeAdsProductID {
                    UserDefaults.standard.set(true, forKey: PurchaseKeys.purchased.rawValue)
                }
                SKPaymentQueue.default().finishTransaction(transaction)
                SKPaymentQueue.default().remove(self)
                delegate?.restoredSuccessfully()
            case .failed, .deferred:
                SKPaymentQueue.default().finishTransaction(transaction)
                SKPaymentQueue.default().remove(self)
                delegate?.paymentError(error: "Purchase failed")
            default:
                if transaction.payment.productIdentifier == removeAdsProductID {
                    UserDefaults.standard.set(true, forKey: PurchaseKeys.purchased.rawValue)
                }
                SKPaymentQueue.default().finishTransaction(transaction)
                SKPaymentQueue.default().remove(self)
            }
        }
    }
}

enum PurchaseKeys: String {
    case purchased = "isPurchased"
}
