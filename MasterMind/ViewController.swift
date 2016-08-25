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

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

