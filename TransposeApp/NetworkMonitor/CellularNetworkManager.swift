//
//  CellularNetworkManager.swift
//  TransposeApp
//
//  Created by Janco Erasmus on 2021/03/18.
//  Copyright © 2021 Janco Erasmus. All rights reserved.
//

import Foundation
import Network

protocol CellularNetworkObservable {
    func didUpdateNetworkStatus()
}

class CellularNetworkManager {
    let networkMonitor: NWPathMonitor
    let firebaseInteractor: FirebaseBoundary
    let delegate: CellularNetworkObservable
    
    init(delegate: CellularNetworkObservable) {
        networkMonitor = NWPathMonitor()
        firebaseInteractor = FirebaseInteractor()
        self.delegate = delegate
        let queue = DispatchQueue(label: "Monitor")
        networkMonitor.start(queue: queue)
    }
    
    func observeNetwork() {
        networkMonitor.pathUpdateHandler = { path in
            if path.status == .satisfied {
                self.firebaseInteractor.fetchFeatureToggle {
                    Cache.sharedInstance.networkState = .online
                    self.delegate.didUpdateNetworkStatus()
                } failure: { (error) in
                     
                }
            }
        }
    }
}
