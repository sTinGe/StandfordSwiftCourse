//
//  Properties.swift
//  L01_StandfordCalculator
//
//  Created by sTinGe Su on 2015/7/2.
//  Copyright (c) 2015年 sTinGe Su. All rights reserved.
//

import Foundation

// properties
func transToDouble(displayValue: String) -> Double {
  return NSNumberFormatter().numberFromString(displayValue)!.doubleValue
}