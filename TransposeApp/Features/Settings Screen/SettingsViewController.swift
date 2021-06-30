//
//  SettingsViewController.swift
//  TransposeApp
//
//  Created by Janco Erasmus on 2021/03/16.
//  Copyright © 2021 Janco Erasmus. All rights reserved.
//

import UIKit
import StoreKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet private var removeAdsBarButton: UIBarButtonItem!
    
    lazy var viewModel = SettingsViewModel(inAppPurchaseHandler: InAppPurchaseHandler())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        viewModel.set(inAppPurchaseHandlerDelegate: self)
        viewModel.fetchProducts()
    }
    
    func setupView() {
        viewModel.isTransposedAlreadyPurchased ?
        (removeAdsBarButton.title = "") : (removeAdsBarButton.title = "Remove Ads")
        removeAdsBarButton.isEnabled = false
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    @IBAction func removeAdsBarButtonTapped(_ sender: Any) {
        presentPurchaseActionSheet()
    }
    
    private func presentPurchaseActionSheet() {
        let actionSheet = UIAlertController(title: "Do you want to remove ads or restore previous purchases?", message: nil, preferredStyle: .actionSheet)
        
        let removeAdsAction = UIAlertAction(title: "Buy Remove Ads", style: .default) { (_) in
            self.viewModel.buyProduct()
        }
        
        let restorePurchasesAction = UIAlertAction(title: "Restore Purchases", style: .default) { (_) in
            self.viewModel.restoreProducts()
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive, handler: nil)
        
        actionSheet.addAction(removeAdsAction)
        actionSheet.addAction(restorePurchasesAction)
        actionSheet.addAction(cancelAction)
        
        self.present(actionSheet, animated: true, completion: nil)
    }
}

extension SettingsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.settingsModelsCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SettingsCell", for: indexPath) as! SettingsTableViewCell
        cell.indexPath = indexPath
        cell.delegate = self
        return cell
    }
}

extension SettingsViewController: SettingsTableViewCellDelegate {
    
    func didTapSwitch(at indexPath: IndexPath, state: Bool) {
        switch indexPath.row {
        case 0:
            viewModel.defaults.set(state, forKey: "useFlatNotes")
        default:
            break
        }
    }
}

extension SettingsViewController: InAppPurchaseHandlerDelegate {
    
    func restoredSuccessfully() {
        let alert = UIAlertController(title: "Success!",
                                      message: "Previously products has been restored",
                                      preferredStyle: .alert)
        let okAlertAction = UIAlertAction(title: "OK", style: .destructive, handler: nil)
        alert.addAction(okAlertAction)
        self.present(alert, animated: true, completion: nil)
        self.setupView()
    }
    
    func productsFetchedSuccessfully() {
        removeAdsBarButton.isEnabled = true
    }
    
    func paymentSuccessful(for product: SKProduct) {
        self.setupView()
    }
    
    func paymentError(error: String) {
        let alert = UIAlertController(title: "Oooops!",
                                      message: error,
                                      preferredStyle: .alert)
        let okAlertAction = UIAlertAction(title: "OK", style: .destructive, handler: nil)
        alert.addAction(okAlertAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    
}
