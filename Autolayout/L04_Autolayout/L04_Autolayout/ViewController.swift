//
//  ViewController.swift
//  L04_Autolayout
//
//  Created by SuStinge on 2015/7/21.
//  Copyright (c) 2015年 SuStinge. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var loginField: UITextField!
  @IBOutlet weak var passwordField: UITextField!

  @IBOutlet weak var passwordLabel: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    updatedUI()
  }
  
  var secure: Bool = false {
    didSet{
      updatedUI()
    }
  }
  
  private func updatedUI() {
    passwordField.secureTextEntry = secure
    passwordLabel.text = secure ? "Secure Password" : "Password"
  }
  
  @IBAction func login() {
  }
  
  @IBAction func toggleSecurity() {
    secure = !secure
  }
  
  
}

