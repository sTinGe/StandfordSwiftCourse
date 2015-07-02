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
    @IBAction func operate(sender: UIButton) {
        let operation = sender.currentTitle!
        if userIsInput {
            enter()
        }
        switch operation {
        case "✕":
            if operandStack.count >= 2 {
                displayValue = operandStack.removeLast() * operandStack.removeLast()
                enter()
            }
        default:
            break
        }
    }
    
    var operandStack = Array<Double>()
    // put number into stack
    @IBAction func enter() {
        userIsInput = false
        operandStack.append(displayValue)
        println("operandStack = \(operandStack)")
    }
    
    var displayValue: Double {
        get {
            return NSNumberFormatter().numberFromString(display.text!)!.doubleValue
        }
        set {
            display.text = "\(newValue)"
            userIsInput = false
        }
    }
    
    
}

