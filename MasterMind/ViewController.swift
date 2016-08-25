//
//  ViewController.swift
//  MasterMind
//
//  Created by Bernardo Trevino on 8/24/16.
//  Copyright © 2016 bernardo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let colorGreen = UIColor.greenColor()
    let colorRed = UIColor.redColor()
    let colorOrange = UIColor.orangeColor()
    let colorBlue = UIColor.blueColor()
    let colorPurple = UIColor.purpleColor()
    let colorCyan = UIColor.cyanColor()
    let colorWhite = UIColor.whiteColor()
    
    @IBOutlet weak var viewGuessFirst: UIView!
    @IBOutlet weak var viewGuessSecond: UIView!
    @IBOutlet weak var viewGuessThird: UIView!
    @IBOutlet weak var viewGuessFourth: UIView!
    @IBOutlet weak var btnGuessFirst: UIButton!
    @IBOutlet weak var btnGuessSecond: UIButton!
    @IBOutlet weak var btnGuessThird: UIButton!
    @IBOutlet weak var btnGuessFourth: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resetCompleteGuess()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func resetCompleteGuess() {
        viewGuessFirst.backgroundColor = randomizeGuess()
        viewGuessSecond.backgroundColor = randomizeGuess()
        viewGuessThird.backgroundColor = randomizeGuess()
        viewGuessFourth.backgroundColor = randomizeGuess()
    }
    
    func randomizeGuess() -> UIColor {
        let randomNumber = Int(arc4random_uniform(6) + 1)
        switch randomNumber {
            case 1: return colorGreen
            case 2: return colorOrange
            case 3: return colorBlue
            case 4: return colorPurple
            case 5: return colorRed
            default: return colorCyan
        }
    }
    
    @IBAction func resetGame(sender: UIButton) {
        resetCompleteGuess()
        btnGuessFirst.backgroundColor = colorGreen
        btnGuessSecond.backgroundColor = colorGreen
        btnGuessThird.backgroundColor = colorGreen
        btnGuessFourth.backgroundColor = colorGreen
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

}

