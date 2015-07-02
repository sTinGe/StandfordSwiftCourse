//
//  Properties.swift
//  L01_StandfordCalculator
//
//  Created by sTinGe Su on 2015/7/2.
//  Copyright (c) 2015年 sTinGe Su. All rights reserved.
//

import Foundation

// properties
func multiply(op1: Double, op2: Double) -> Double {
  return op2 * op1
}

func divide(op1: Double, op2: Double) -> Double {
  return op2 / op1
}

func plus(op1: Double, op2: Double) -> Double {
  return op2 + op1
}

func minus(op1: Double, op2: Double) -> Double {
  return op2 - op1
}

func transToDouble(displayValue: String) -> Double {
  return NSNumberFormatter().numberFromString(displayValue)!.doubleValue
}