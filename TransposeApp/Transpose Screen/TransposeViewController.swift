//
//  TransposeViewController.swift
//  TransposeApp
//
//  Created by Janco Erasmus on 2021/03/10.
//  Copyright © 2021 Janco Erasmus. All rights reserved.
//

import UIKit

class TransposeViewController: UIViewController {

    @IBOutlet weak var firstNoteView: TransposedNoteView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        firstNoteView.populateNoteView(noteNumber: "3rd", noteFrom: "C", noteTo: "B")
    }
}
