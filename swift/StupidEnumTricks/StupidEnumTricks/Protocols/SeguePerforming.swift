//
//  SeguePerforming.swift
//  StupidEnumTricks
//
//  Created by Ellen Shapiro on 5/10/18.
//  Copyright © 2018 Designated Nerd Software. All rights reserved.
//

import UIKit

protocol SeguePerforming {
  var rawValue: String { get }
}

extension UIViewController {
  
  func perform<T: SeguePerforming>(segue: T, sender: Any? = nil) {
    performSegue(withIdentifier: segue.rawValue, sender: sender)
  }
}
