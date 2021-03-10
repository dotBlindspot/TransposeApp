//
//  SecondViewController.swift
//  TransposeApp
//
//  Created by Janco Erasmus on 2019/02/12.
//  Copyright © 2019 Janco Erasmus. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    //PianoNoteButtons
    //WhiteNotes
    @IBOutlet weak var c1Button : UIButton!
    @IBOutlet weak var d1Button : UIButton!
    @IBOutlet weak var e1Button : UIButton!
    @IBOutlet weak var f1Button : UIButton!
    @IBOutlet weak var g1Button : UIButton!
    @IBOutlet weak var a1Button : UIButton!
    @IBOutlet weak var b1Button : UIButton!
    @IBOutlet weak var c2Button : UIButton!
    @IBOutlet weak var d2Button : UIButton!
    @IBOutlet weak var e2Button : UIButton!
    //BlackNotes
    @IBOutlet weak var db1Button : UIButton!
    @IBOutlet weak var eb1Button : UIButton!
    @IBOutlet weak var gb1Button : UIButton!
    @IBOutlet weak var ab1Button : UIButton!
    @IBOutlet weak var bb1Button : UIButton!
    @IBOutlet weak var db2Button : UIButton!
    @IBOutlet weak var eb2Button : UIButton!
    
    //Chords
    @IBOutlet weak var firstChordButton: customButton!
    @IBOutlet weak var secondChordButton: customButton!
    @IBOutlet weak var thirdChordButton: customButton!
    @IBOutlet weak var fourthChordButton: customButton!
    @IBOutlet weak var fifthChordButton: customButton!
    @IBOutlet weak var sixthChordButton: customButton!
    
    @IBOutlet weak var comingSoonImage: UIImageView!
    @IBOutlet weak var instrumentChooserObject: UISegmentedControl!
    
    @IBOutlet weak var tabBarChords: UITabBarItem!
    
    var arrTransposedScaleNotes:[Int]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        rotateButtons()
        addtextToButtons()
        populateArray()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        rotateButtons()
        addtextToButtons()
        populateArray()
    }
    
    @IBAction func firstChordButton(_ sender: Any) {
        resetAllNoteButtonOpacity()
        let baseNote = arrTransposedScaleNotes![0]
        showChord(note: baseNote, isMajor: true)
    }
    
    @IBAction func secondChordButton(_ sender: Any) {
        resetAllNoteButtonOpacity()
        let baseNote = arrTransposedScaleNotes![1]
        showChord(note: baseNote, isMajor: false)
    }
    @IBAction func thirdChordButton(_ sender: Any) {
        resetAllNoteButtonOpacity()
        let baseNote = arrTransposedScaleNotes![2]
        showChord(note: baseNote, isMajor: false)
    }
    @IBAction func fourthChordButton(_ sender: Any) {
        resetAllNoteButtonOpacity()
        let baseNote = arrTransposedScaleNotes![3]
        showChord(note: baseNote, isMajor: true)
    }
    @IBAction func fifthChordButton(_ sender: Any) {
        resetAllNoteButtonOpacity()
        let baseNote = arrTransposedScaleNotes![4]
        showChord(note: baseNote, isMajor: true)
    }
    @IBAction func sixthChordButton(_ sender: Any) {
        resetAllNoteButtonOpacity()
        let baseNote = arrTransposedScaleNotes![5]
        showChord(note: baseNote, isMajor: false)
    }
    
    @IBAction func instrumentChooser(_ sender: Any) {
        if instrumentChooserObject.selectedSegmentIndex == 1{
            //comingSoonImage.isHidden = false
        }
        else{
            //comingSoonImage.isHidden = true
        }
    }
    
    //FUNCTIONS

    func rotateButtons(){
        firstChordButton.transform  = CGAffineTransform(rotationAngle: CGFloat.pi/2)
        secondChordButton.transform = CGAffineTransform(rotationAngle: CGFloat.pi/2)
        thirdChordButton.transform  = CGAffineTransform(rotationAngle: CGFloat.pi/2)
        fourthChordButton.transform = CGAffineTransform(rotationAngle: CGFloat.pi/2)
        fifthChordButton.transform  = CGAffineTransform(rotationAngle: CGFloat.pi/2)
        sixthChordButton.transform  = CGAffineTransform(rotationAngle: CGFloat.pi/2)
    }
    
    func addtextToButtons(){
        firstChordButton.setTitle(notes[transposedIndex], for: .normal)
        secondChordButton.setTitle(notes[transposedIndex + 2] + "m", for: .normal)
        thirdChordButton.setTitle(notes[transposedIndex + 4] + "m", for: .normal)
        fourthChordButton.setTitle(notes[transposedIndex + 5], for: .normal)
        fifthChordButton.setTitle(notes[transposedIndex + 7], for: .normal)
        sixthChordButton.setTitle(notes[transposedIndex + 9] + "m", for: .normal)
    }
    
    func populateArray(){
        arrTransposedScaleNotes = [transposedIndex,transposedIndex+2,transposedIndex+4,transposedIndex+5,transposedIndex+7,transposedIndex+9,transposedIndex+11]
        
        for k in 0..<7{
            var temp = arrTransposedScaleNotes![k]
            if (temp > 11){
                temp = temp - 12
                arrTransposedScaleNotes![k] = temp
            }
        }
    }
    
    func showChord(note: Int, isMajor: Bool){
        if isMajor{
            switch note {
            case 0:
                a1Button.alpha  = 0.5
                db1Button.alpha = 0.5
                e2Button.alpha  = 0.5
            case 1:
                bb1Button.alpha  = 0.5
                d2Button.alpha  = 0.5
                //outbounds
            case 2:
                b1Button.alpha = 0.5
                eb2Button.alpha = 0.5
                //outBounds
            case 3:
                c1Button.alpha = 0.5
                e1Button.alpha = 0.5
                g1Button.alpha = 0.5
            case 4:
                db1Button.alpha  = 0.5
                f1Button.alpha  = 0.5
                ab1Button.alpha  = 0.5
            case 5:
                d1Button.alpha  = 0.5
                gb1Button.alpha = 0.5
                a1Button.alpha  = 0.5
            case 6:
                eb1Button.alpha  = 0.5
                g1Button.alpha  = 0.5
                bb1Button.alpha  = 0.5
            case 7:
                e1Button.alpha  = 0.5
                ab1Button.alpha = 0.5
                b1Button.alpha  = 0.5
            case 8:
                f1Button.alpha = 0.5
                a1Button.alpha = 0.5
                c2Button.alpha = 0.5
            case 9:
                gb1Button.alpha  = 0.5
                bb1Button.alpha  = 0.5
                db1Button.alpha  = 0.5
            case 10:
                g1Button.alpha = 0.5
                b1Button.alpha = 0.5
                d2Button.alpha = 0.5
            case 11:
                ab1Button.alpha  = 0.5
                c2Button.alpha  = 0.5
                eb2Button.alpha  = 0.5
            default:
                c1Button.alpha = 0.2
                d1Button.alpha = 0.2
            }
        }else{
            switch note {
            case 0:
                a1Button.alpha  = 0.5
                c2Button.alpha = 0.5
                e2Button.alpha  = 0.5
            case 1:
                bb1Button.alpha  = 0.5
                db2Button.alpha  = 0.5
                //outbounds
            case 2:
                b1Button.alpha = 0.5
                d2Button.alpha = 0.5
                //outBounds
            case 3:
                c1Button.alpha = 0.5
                eb1Button.alpha = 0.5
                g1Button.alpha = 0.5
            case 4:
                db1Button.alpha  = 0.5
                e1Button.alpha  = 0.5
                ab1Button.alpha  = 0.5
            case 5:
                d1Button.alpha  = 0.5
                f1Button.alpha = 0.5
                a1Button.alpha  = 0.5
            case 6:
                eb1Button.alpha  = 0.5
                gb1Button.alpha  = 0.5
                bb1Button.alpha  = 0.5
            case 7:
                e1Button.alpha  = 0.5
                g1Button.alpha = 0.5
                b1Button.alpha  = 0.5
            case 8:
                f1Button.alpha = 0.5
                ab1Button.alpha = 0.5
                c2Button.alpha = 0.5
            case 9:
                gb1Button.alpha  = 0.5
                a1Button.alpha  = 0.5
                db1Button.alpha  = 0.5
            case 10:
                g1Button.alpha = 0.5
                bb1Button.alpha = 0.5
                d2Button.alpha = 0.5
            case 11:
                ab1Button.alpha  = 0.5
                b1Button.alpha  = 0.5
                eb2Button.alpha  = 0.5
            default:
                c1Button.alpha = 0.2
                d1Button.alpha = 0.2
            }
        }
    }
    
    func resetAllNoteButtonOpacity(){
        c1Button.alpha = 1
        d1Button.alpha = 1
        e1Button.alpha = 1
        f1Button.alpha = 1
        g1Button.alpha = 1
        a1Button.alpha = 1
        b1Button.alpha = 1
        c2Button.alpha = 1
        d2Button.alpha = 1
        e2Button.alpha = 1
        db1Button.alpha = 1
        eb1Button.alpha = 1
        gb1Button.alpha = 1
        ab1Button.alpha = 1
        bb1Button.alpha = 1
        db2Button.alpha = 1
        eb2Button.alpha = 1
    }
}

