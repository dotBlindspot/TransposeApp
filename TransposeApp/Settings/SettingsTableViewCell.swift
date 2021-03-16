//
//  SettingsTableViewCell.swift
//  TransposeApp
//
//  Created by Janco Erasmus on 2021/03/16.
//  Copyright © 2021 Janco Erasmus. All rights reserved.
//

import UIKit

class SettingsTableViewCell: UITableViewCell {

    @IBOutlet weak var switchView: UISwitch!
    @IBOutlet weak var settingNameLabel: UILabel!
    
    var indexPath: IndexPath!
    var delegate: SettingsTableViewCellDelegate?
    lazy var viewModel = SettingsViewModel()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
    @IBAction func switchTapped(_ sender: Any) {
        delegate?.didTapSwitch(at: indexPath, state: switchView.isOn)
    }
    
    private func configureUI() {
        for model in viewModel.requestSettingsModels {
            populateTableViewCell(with: model)
        }
    }
    
    private func populateTableViewCell(with model: SettingsModel) {
        switchView.setOn(model.isOn, animated: true)
        settingNameLabel.text = model.name
    }
}
