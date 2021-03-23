//
//  UIViewController + Extensions.swift
//  TransposeApp
//
//  Created by Janco Erasmus on 2021/03/18.
//  Copyright © 2021 Janco Erasmus. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func displayDefaultAlert(with message: String?, segueIdentifier: String?) {
        let alert = UIAlertController(title: "Something went wrong!",
                                      message: message ?? "",
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: { (_) in
            if let segueIdentifier = segueIdentifier {
                self.performSegue(withIdentifier: segueIdentifier, sender: self)
            }
        }))
        present(alert, animated: true, completion: nil)
    }
}
