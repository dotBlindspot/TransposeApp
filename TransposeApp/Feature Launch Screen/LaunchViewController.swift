//
//  LaunchViewController.swift
//  TransposeApp
//
//  Created by Janco Erasmus on 2021/03/17.
//  Copyright © 2021 Janco Erasmus. All rights reserved.
//

import UIKit

class LaunchViewController: UIViewController {
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    lazy var viewModel = LaunchViewModel(delegate: self,
                                         interactor: FirebaseInteractor(),
                                         inAppPurchaseManager: InAppPurchaseHelper(productIdentifiers: TransposeProduct.productIdentifiers))

    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.startAnimating()
        viewModel.requestFeatureToggles()
    }
}

extension LaunchViewController: LaunchViewModelDelegate {
    func didFail(with error: String?) {
        activityIndicator.stopAnimating()
        let alert = UIAlertController(title: "Something went wrong!",
                                      message: error ?? "",
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: { (_) in
            self.performSegue(withIdentifier: "MoveToTransposeScreen", sender: self)
        }))
        present(alert, animated: true, completion: nil)
    }

    func didFinishLoading() {
        activityIndicator.stopAnimating()
        performSegue(withIdentifier: "MoveToTransposeScreen", sender: self)
    }
}
