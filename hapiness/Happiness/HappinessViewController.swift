//
//  HappinessViewController.swift
//  L02_Happiness
//
//  Created by SuStinge on 2015/7/11.
//  Copyright (c) 2015年 SuStinge. All rights reserved.
//

import UIKit

class HappinessViewController: UIViewController {
  var happiness: Int = 50 { // 0 = very sad
    didSet {
      happiness = min(max(happiness, 0), 100)
      println("happiness = \(happiness)")
      updateUI()
    }
  }
  func updateUI() {
  }
}
