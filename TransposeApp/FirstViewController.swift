//
//  TransposeAppViewController.swift
//  TransposeApp
//
//  Created by Janco Erasmus on 2019/02/12.
//  Copyright © 2019 Janco Erasmus. All rights reserved.
//

import UIKit
import GoogleMobileAds

let notes: [String] = ["A","Bb","B","C","Db","D","Eb","E","F","Gb","G","Ab",
                       "A","Bb","B","C","Db","D","Eb","E","F","Gb","G","Ab",
                       "A","Bb","B","C","Db","D","Eb","E","F","Gb","G","Ab"]

var transposedIndex: Int = 0

class FirstViewController: UIViewController {
    
    @IBOutlet weak var capoSegment: UISegmentedControl!
    
    @IBOutlet weak var lblFromNote: UILabel!
    @IBOutlet weak var lblToNote: UILabel!
    @IBOutlet weak var fromStepper: UIStepper!
    @IBOutlet weak var toStepper: UIStepper!
    
    @IBOutlet weak var lblFirst: UILabel!
    @IBOutlet weak var lblSecond: UILabel!
    @IBOutlet weak var lblThird: UILabel!
    @IBOutlet weak var lblFourth: UILabel!
    @IBOutlet weak var lblFifth: UILabel!
    @IBOutlet weak var lblSixth: UILabel!
    @IBOutlet weak var lblSeventh: UILabel!
    
    @IBOutlet weak var lblFirstTo: UILabel!
    @IBOutlet weak var lblSeconfTo: UILabel!
    @IBOutlet weak var lblThirdTo: UILabel!
    @IBOutlet weak var lblFourthTo: UILabel!
    @IBOutlet weak var lblFifthTo: UILabel!
    @IBOutlet weak var lblSixthTo: UILabel!
    @IBOutlet weak var lblSeventhTo: UILabel!
    
    @IBOutlet weak var toLabel: UILabel!
    @IBOutlet weak var fromLabel: UILabel!
    
    @IBOutlet weak var transposeBtnObject: customButton!
    
    @IBOutlet weak var scaleOfFromLabel: UILabel!
    @IBOutlet weak var scaleOfToLabel: UILabel!

    @IBOutlet weak var bannerView: GADBannerView!
    
    let capo:[String] = ["+0","+1","+2","+3","+4","+5","+6","+7","+8","+9","+10","+11"]
    
    var capoOn: Bool = false
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //To implement the add ==========================================
        bannerView.adUnitID = "ca-app-pub-4040587998998922/5777511147"
        //For Implementation use: ca-app-pub-4040587998998922/5777511147
        //For Testing use: ca-app-pub-3940256099942544/2934735716
        bannerView.rootViewController = self
        bannerView.load(GADRequest())
        //===============================================================
        
        if capoSegment.selectedSegmentIndex == 0 {
            capoOn = false
            fromLabel.text = "Key from"
            toLabel.text   = "Key to"
        }else{
            capoOn = true
            fromLabel.text = "Play in"
            toLabel.text   = "Capo on"
        }
        
        scaleOfFromLabel.text = "Scale of the key " + notes[Int(fromStepper.value)]
        scaleOfToLabel.text   = "Scale of the key " + notes[Int(toStepper.value)]
   
        view.setGradientBackGroundColor(colorOne: UIColor.white, colorTwo: UIColor.white)
        lblFromNote.text = notes[10]
        lblToNote.text = notes[3]
        transposeChords(from: 10, to: 3)
    }

    @IBAction func capoSegmentChanged(_ sender: Any) {
        if capoOn{
            capoOn = false
            lblToNote.text = notes[Int(toStepper.value)]
            fromLabel.text = "Key from"
            toLabel.text   = "Key to"
        }else{
            capoOn = true
            lblToNote.text = notes[Int(toStepper.value)]
            fromLabel.text = "Play in"
            toLabel.text   = "Using Key of"
        }
    }
    
    @IBAction func transposeButtonTouched(_ sender: Any) {
        if capoOn {
            let playInKey      = fromStepper.value
            let playWithChords = toStepper.value
            var capoFretNumber = playInKey - playWithChords

            transposeChords(from: Int(playInKey), to: Int(playWithChords))
            
            if capoFretNumber < 0{
                capoFretNumber += 12
            }
            
            switch (Int(capoFretNumber)){
            case 1: transposeBtnObject.setTitle("Capo on " + String(Int(capoFretNumber)) + "st Fret", for: .normal)
            case 2: transposeBtnObject.setTitle("Capo on " + String(Int(capoFretNumber)) + "nd Fret", for: .normal)
            case 3: transposeBtnObject.setTitle("Capo on " + String(Int(capoFretNumber)) + "rd Fret", for: .normal)
            default: transposeBtnObject.setTitle("Capo on " + String(Int(capoFretNumber)) + "th Fret", for: .normal)
            }
        }else{
            let fromNote = fromStepper.value
            let toNote   = toStepper.value
            
            transposedIndex = Int(toNote)
            transposeChords(from: Int(fromNote), to: Int(toNote))
        }
        scaleOfFromLabel.text = "Scale of the key " + notes[Int(fromStepper.value)]
        scaleOfToLabel.text   = "Scale of the key " + notes[Int(toStepper.value)]
    }
    
    @IBAction func fromStepperChanged(_ sender: Any) {
        lblFromNote.text = notes[Int(fromStepper.value)]
    }
    
    @IBAction func toStepperChanged(_ sender: Any) {
        if capoOn{
            lblToNote.text = notes[Int(toStepper.value)]
        }else{
            lblToNote.text = notes[Int(toStepper.value)]
        }
    }
    
    func transposeChords(from : Int,to: Int) {
        lblFirst.text   = notes[from]
        lblSecond.text  = notes[from + 2] + "m"
        lblThird.text   = notes[from + 4] + "m"
        lblFourth.text  = notes[from + 5]
        lblFifth.text   = notes[from + 7]
        lblSixth.text   = notes[from + 9] + "m"
        lblSeventh.text = notes[from + 11]
        
        lblFirstTo.text   = notes[to]
        lblSeconfTo.text  = notes[to + 2] + "m"
        lblThirdTo.text   = notes[to + 4] + "m"
        lblFourthTo.text  = notes[to + 5]
        lblFifthTo.text   = notes[to + 7]
        lblSixthTo.text   = notes[to + 9] + "m"
        lblSeventhTo.text = notes[to + 11]
    }
    
    func putCapoOn(from: Int, capo: Int) {
        let newKey = from + capo
        lblFirst.text   = notes[from]
        lblSecond.text  = notes[from + 2] + "m"
        lblThird.text   = notes[from + 4] + "m"
        lblFourth.text  = notes[from + 5]
        lblFifth.text   = notes[from + 7]
        lblSixth.text   = notes[from + 9] + "m"
        lblSeventh.text = notes[from + 11]
        
        lblFirstTo.text   = notes[newKey]
        lblSeconfTo.text  = notes[newKey + 2] + "m"
        lblThirdTo.text   = notes[newKey + 4] + "m"
        lblFourthTo.text  = notes[newKey + 5]
        lblFifthTo.text   = notes[newKey + 7]
        lblSixthTo.text   = notes[newKey + 9] + "m"
        lblSeventhTo.text = notes[newKey + 11]
    }
}
