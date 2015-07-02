//
//  OperandStack.swift
//  L01_StandfordCalculator
//
//  Created by sTinGe Su on 2015/7/2.
//  Copyright (c) 2015年 sTinGe Su. All rights reserved.
//

import Foundation

class OperandStack {
  var stack: Array<Double> = []
  var displayValue: Double = 0
  
  func store(value: Double) {
    displayValue = value
  }
  func push() {
    stack.append(displayValue)
  }
  
  func pop() -> Double {
    return stack.removeLast()
  }
  
  func peek() -> Double {
    return stack[stack.count-1]
  }
  
  func size() -> Int {
    return stack.count
  }
  
  func isEmpty() -> Bool {
    if stack.count == 0 {
      return true
    } else {
      return false
    }
  }
  
  func traversal() -> Array<Double>{
    return stack
  }
}