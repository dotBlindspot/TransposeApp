//
//  SettingsViewController.swift
//  TransposeApp
//
//  Created by Janco Erasmus on 2021/03/16.
//  Copyright © 2021 Janco Erasmus. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var removeAdsButton: UIButton!
    
    lazy var viewModel = SettingsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    @IBAction func removeAdsButtonTapped(_ sender: Any) {
        #warning("In app Purchase - How to: https://www.raywenderlich.com/5456-in-app-purchase-tutorial-getting-started")
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
