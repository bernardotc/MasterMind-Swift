//
//  ViewController.swift
//  MasterMind
//
//  Created by Bernardo Trevino on 8/24/16.
//  Copyright © 2016 bernardo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var turnCounter = 0
    var arrGuessColors: [UIColor] = []
    
    let colorGreen = UIColor.greenColor()
    let colorRed = UIColor.redColor()
    let colorOrange = UIColor.orangeColor()
    let colorBlue = UIColor.blueColor()
    let colorPurple = UIColor.purpleColor()
    let colorCyan = UIColor.cyanColor()
    let colorWhite = UIColor.whiteColor()
    
    @IBOutlet weak var viewGuessWrapper: UIView!
    @IBOutlet weak var viewGuessFirst: UIView!
    @IBOutlet weak var viewGuessSecond: UIView!
    @IBOutlet weak var viewGuessThird: UIView!
    @IBOutlet weak var viewGuessFourth: UIView!
    
    @IBOutlet weak var btnGuessFirst: UIButton!
    @IBOutlet weak var btnGuessSecond: UIButton!
    @IBOutlet weak var btnGuessThird: UIButton!
    @IBOutlet weak var btnGuessFourth: UIButton!
    
    @IBOutlet weak var viewHintFirst: UIView!
    @IBOutlet weak var viewHintSecond: UIView!
    @IBOutlet weak var viewHintThird: UIView!
    @IBOutlet weak var viewHintFourth: UIView!
    
    @IBOutlet weak var segCtrlPlay: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resetCompleteGuess()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func resetCompleteGuess() {
        arrGuessColors = []
        randomizeGuess()
        viewGuessFirst.backgroundColor = arrGuessColors[0]
        viewGuessSecond.backgroundColor = arrGuessColors[1]
        viewGuessThird.backgroundColor = arrGuessColors[2]
        viewGuessFourth.backgroundColor = arrGuessColors[3]

    }
    
    func randomizeGuess() {
        while arrGuessColors.count < 4 {
            let randomNumber = Int(arc4random_uniform(6) + 1)
            switch randomNumber {
                case 1:
                    if !arrGuessColors.contains(colorGreen) {
                        arrGuessColors.append(colorGreen)
                    }
                case 2:
                    if !arrGuessColors.contains(colorBlue) {
                        arrGuessColors.append(colorBlue)
                    }
                case 3:
                    if !arrGuessColors.contains(colorPurple) {
                        arrGuessColors.append(colorPurple)
                    }
                case 4:
                    if !arrGuessColors.contains(colorRed) {
                        arrGuessColors.append(colorRed)
                    }
                case 5:
                    if !arrGuessColors.contains(colorOrange) {
                        arrGuessColors.append(colorOrange)
                    }
                default:
                    if !arrGuessColors.contains(colorCyan) {
                        arrGuessColors.append(colorCyan)
                    }
            }
        }
    }
    
    func setHints(correctPosAndColor: Int, correctColor: Int) {
        var arrHintColors: [UIColor] = []
        var indexPosAndColor = correctPosAndColor
        while indexPosAndColor > 0 {
            arrHintColors.append(colorRed)
            indexPosAndColor -= 1
        }
        var indexColor = correctColor
        while indexColor > 0 {
            arrHintColors.append(colorWhite)
            indexColor -= 1
        }
        while arrHintColors.count < 4 {
            arrHintColors.append(UIColor.clearColor())
        }
        viewHintFirst.backgroundColor = arrHintColors[0]
        viewHintSecond.backgroundColor = arrHintColors[1]
        viewHintThird.backgroundColor = arrHintColors[2]
        viewHintFourth.backgroundColor = arrHintColors[3]
        if (correctPosAndColor == 4) {
            let alert = UIAlertController(title: "Ganaste!", message: "Felicidades! Ganaste en el intento \(turnCounter)", preferredStyle: .Alert)
            alert.addAction(UIAlertAction(title: "OK", style: .Cancel, handler: nil))
            presentViewController(alert, animated: true, completion: nil)
        }
    }
    
    @IBAction func resetGame(sender: UIButton) {
        turnCounter = 0
        if segCtrlPlay.selectedSegmentIndex == 1 {
            segCtrlPlay.selectedSegmentIndex = 0
            viewGuessWrapper.hidden = true
        }
        resetCompleteGuess()
        btnGuessFirst.backgroundColor = colorGreen
        btnGuessSecond.backgroundColor = colorGreen
        btnGuessThird.backgroundColor = colorGreen
        btnGuessFourth.backgroundColor = colorGreen
        viewHintFirst.backgroundColor = UIColor.clearColor()
        viewHintSecond.backgroundColor = UIColor.clearColor()
        viewHintThird.backgroundColor = UIColor.clearColor()
        viewHintFourth.backgroundColor = UIColor.clearColor()
    }

    @IBAction func changeColor(sender: UIButton) {
        let colorButton = sender.backgroundColor
        if colorButton == colorGreen {
            sender.backgroundColor = colorOrange
        } else if colorButton == colorOrange {
            sender.backgroundColor = colorBlue
        } else if colorButton == colorBlue {
            sender.backgroundColor = colorPurple
        } else if colorButton == colorPurple {
            sender.backgroundColor = colorRed
        } else if colorButton == colorRed {
            sender.backgroundColor = colorCyan
        } else {
            sender.backgroundColor = colorGreen
        }
    }

    @IBAction func checkGuess(sender: UIButton) {
        var arrTryGuess: [UIColor] = [btnGuessFirst.backgroundColor!, btnGuessSecond.backgroundColor!, btnGuessThird.backgroundColor!, btnGuessFourth.backgroundColor!]
        let duplicateColors = Array(Set(arrTryGuess.filter({ (i:UIColor) in arrTryGuess.filter({$0 == i}).count == 1})))
        if (duplicateColors.count != arrTryGuess.count) {
            let alert = UIAlertController(title: "Cuidado", message: "No debe de haber colores repetidos.", preferredStyle: .Alert)
            alert.addAction(UIAlertAction(title: "OK", style: .Cancel, handler: nil))
            presentViewController(alert, animated: true, completion: nil)
        } else {
            turnCounter += 1
            var correctColorAndPosition = 0
            var correctColorOnly = 0
            for index in 0...3 {
                if arrGuessColors.contains(arrTryGuess[index]) {
                    if arrGuessColors[index] == arrTryGuess[index] {
                        correctColorAndPosition += 1
                    } else {
                        correctColorOnly += 1
                    }
                }
            }
            setHints(correctColorAndPosition, correctColor: correctColorOnly)
        }
    }
    
    @IBAction func displayOrNotGuess(sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
            case 0: viewGuessWrapper.hidden = true
            default: viewGuessWrapper.hidden = false
        }
    }
}

