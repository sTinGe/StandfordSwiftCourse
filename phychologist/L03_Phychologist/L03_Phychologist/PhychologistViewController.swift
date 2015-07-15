//
//  ViewController.swift
//  L03_Phychologist
//
//  Created by SuStinge on 2015/7/15.
//  Copyright (c) 2015年 SuStinge. All rights reserved.
//

import UIKit

class PhychologistViewController: UIViewController {
  @IBAction func nothing(sender: UIButton) {
    performSegueWithIdentifier("nothing", sender: nil)
  }
  
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    var destination = segue.destinationViewController as? UIViewController
    if let navCon = destination as? UINavigationController {
      destination = navCon.visibleViewController
    }
    
    if let hvc = destination as? HappinessViewController {
      if let identifier = segue.identifier {
        switch identifier {
          case "sad":
            hvc.happiness = 0
          case "happy":
            hvc.happiness = 100
          default:
            hvc.happiness = 50
        }
      }
    }
  }
}

