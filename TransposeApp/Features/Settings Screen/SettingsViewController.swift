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
        viewModel.buyProduct()
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
    
    func productsFetchedSuccessfully() {
        removeAdsBarButton.isEnabled = true
    }
    
    func paymentSuccessful(for product: SKProduct) {
//        let alert = UIAlertController(title: "Purchase was successful",
//                                      message: "Thank you for your support/nEnjoy the ad-free life/nProduct: \(product.localizedTitle)",
//                                      preferredStyle: .alert)
//        let okAlertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
//        alert.addAction(okAlertAction)
//        alert.present(self, animated: true, completion: nil)
    }
    
    func paymentError(error: String) {
//        let alert = UIAlertController(title: "Purchase was unsuccessful",
//                                      message: "Please try again later",
//                                      preferredStyle: .alert)
//        let okAlertAction = UIAlertAction(title: "OK", style: .destructive, handler: nil)
//        alert.addAction(okAlertAction)
//        alert.present(self, animated: true, completion: nil)
    }
}
