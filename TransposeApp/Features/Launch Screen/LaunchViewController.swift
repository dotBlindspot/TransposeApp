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
                                         interactor: FirebaseInteractor())

    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.startAnimating()
        viewModel.requestFeatureToggles()
    }
}

extension LaunchViewController: LaunchViewModelDelegate {
    func didFail(with error: String?) {
        activityIndicator.stopAnimating()
        self.displayDefaultAlert(with: error, segueIdentifier: "MoveToTransposeScreen")
    }

    func didFinishLoading() {
        activityIndicator.stopAnimating()
        performSegue(withIdentifier: "MoveToTransposeScreen", sender: self)
    }
}
