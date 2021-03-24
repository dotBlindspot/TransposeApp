//
//  SettingsTableViewCellDelegate.swift
//  TransposeApp
//
//  Created by Janco Erasmus on 2021/03/16.
//  Copyright © 2021 Janco Erasmus. All rights reserved.
//

import Foundation

protocol SettingsTableViewCellDelegate {
    func didTapSwitch(at indexPath: IndexPath, state: Bool)
}
