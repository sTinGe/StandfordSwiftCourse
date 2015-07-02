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
    case "✕": performOperation{ $0 * $1 }
    case "÷": performOperation{ $1 / $0 }
    case "+": performOperation{ $0 + $1 }
    case "−": performOperation{ $1 - $0 }
    case "√": performOperation{ sqrt($0) }
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
  
  private func performOperation(operation: Double -> Double) {
    if operand.size() >= 1 {
      displayValue = operation(operand.pop())
      enter()
    }
  }
  
  // put the number into stack
  @IBAction func enter() {
    operand.store(transToDouble(display.text!))
    userIsInput = false
    operand.push()
    println("\(operand.traversal())")
  }
  
  // properties
  var displayValue: Double {
    get {
      return transToDouble(display.text!)
    }
    set {
      display.text = "\(newValue)"
      userIsInput = false
    }
  }
  
  
}

