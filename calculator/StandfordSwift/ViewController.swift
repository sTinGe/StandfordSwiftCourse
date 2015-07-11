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
  var operandStack = OperandStack()
  
  
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
    if userIsInput {
      enter()
    }
    
    if let operation = sender.currentTitle {
      if let result = operandStack.peformOperation(operation) {
        displayValue = result
      } else {
        displayValue = 0
      }
    }
    
  }
  
  // put the number into stack
  @IBAction func enter() {
    userIsInput = false
    if let result = operandStack.push(displayValue) {
      displayValue = result
    } else {
      displayValue = 0
    }
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

