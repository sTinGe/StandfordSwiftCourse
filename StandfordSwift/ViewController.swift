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
  var operand = OperandStack()
  
  
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
    case "✕": performOperation(multiply)
    case "÷": performOperation(divide)
    case "+": performOperation(plus)
    case "−": performOperation(minus)
    default:
      break
    }
  }
  
  func performOperation(operation: (Double, Double) -> Double) {
    if operand.size() >= 2 {
      displayValue = operation(operand.pop(), operand.pop())
      enter()
    }
  }
  
  // put the number into stack
  @IBAction func enter() {
    userIsInput = false
    operand.push(displayValue)
    println("\(operand.traversal())")
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

