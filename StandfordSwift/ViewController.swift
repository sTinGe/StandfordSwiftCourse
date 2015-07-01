//
//  ViewController.swift
//  StandfordSwift
//
//  Created by sTinGe Su on 2015/7/1.
//  Copyright (c) 2015年 sTinGe Su. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{

    @IBOutlet weak var display: UILabel!
    var userIsInput:Bool = false
    
    @IBAction func appendDigit(sender: UIButton) {
        let digit = sender.currentTitle!
        if userIsInput {
            display.text = display.text! + digit
        } else {
            display.text = digit
            userIsInput = true
        }
    }
}

