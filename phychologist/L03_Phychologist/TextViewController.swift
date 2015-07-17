//
//  TextViewController.swift
//  L03_Phychologist
//
//  Created by sTinGe Su on 2015/7/17.
//  Copyright (c) 2015年 SuStinge. All rights reserved.
//

import UIKit

class TextViewController: UIViewController {
  @IBOutlet weak var textView: UITextView! {
    didSet {
      textView?.text = text
    }
  }
  
  var text: String = "" {
    didSet {
      textView?.text = text
    }
  }

  override var preferredContentSize: CGSize {
    get {
      if textView != nil && presentingViewController != nil {
        return textView.sizeThatFits(presentingViewController!.view.bounds.size)
      }
      else {
        return super.preferredContentSize
      }
    }
    set {
      super.preferredContentSize = newValue
    }
  }
}
