//
//  UIViewController.swift
//  Habitual
//
//  Created by Jose Arellanes on 3/2/20.
//  Copyright © 2020 Jose Arellanes. All rights reserved.
//

import UIKit

extension UIViewController {
  static func instantiate() -> Self {
    return self.init(nibName: String(describing: self), bundle: nil)
  }
}
