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
  
  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var companyLabel: UILabel!
  @IBOutlet weak var imageView: UIImageView!
  override func viewDidLoad() {
    super.viewDidLoad()
    updatedUI()
  }
  
  var loggedInUser: User? { didSet{ updatedUI() } }
  var secure: Bool = false { didSet{ updatedUI() } }
  
  private func updatedUI() {
    passwordField.secureTextEntry = secure
    passwordLabel.text = secure ? "Secure Password" : "Password"
    nameLabel.text = loggedInUser?.name
    companyLabel.text = loggedInUser?.company
    image = loggedInUser?.image
  }
  
  @IBAction func login() {
    loggedInUser = User.login(loginField.text ?? "", password: passwordField.text ?? "")
  }
  
  @IBAction func toggleSecurity() {
    secure = !secure
  }
  
  var image: UIImage? {
    get {
      return imageView.image
    }
    set {
      imageView.image = newValue
      if let constrainedView = imageView {
        if let newImage = newValue {
          aspectRatioConstraint = NSLayoutConstraint(
            item: constrainedView,
            attribute: .Width,
            relatedBy: .Equal,
            toItem: constrainedView,
            attribute: .Height,
            multiplier: newImage.aspectRatio,
            constant: 0)
        } else {
          aspectRatioConstraint = nil
        }
      }
    }
  }
  var aspectRatioConstraint: NSLayoutConstraint? {
    willSet {
      if let existingConstraint = aspectRatioConstraint {
        view.removeConstraint(existingConstraint)
      }
    }
    didSet {
      if let newCOnstraint = aspectRatioConstraint {
        view.addConstraint(newCOnstraint)
      }
    }
  }
  
}

extension User {
  var image: UIImage? {
    if let image = UIImage(named: login) {
      return image
    } else {
      return UIImage(named: "unknown_user")
    }
  }
}

extension UIImage {
  var aspectRatio: CGFloat {
    return size.height != 0 ? size.width / size.height : 0
  }
}