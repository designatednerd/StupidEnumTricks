//
//  Asset.swift
//  StupidEnumTricks
//

//  Created by Ellen Shapiro on 5/15/18.
//  Copyright © 2018 Designated Nerd Software. All rights reserved.
//

import UIKit

enum Asset: String {
  case cinnamon_rolls
  case innocent
  case no
  case snack
  case window

  var image: UIImage {
    return UIImage(named: self.rawValue)!
  }
  
  // A simulation of `CaseIterable`, coming in Swift 4.2
  static var allCases: [Asset] {
    return [
      .cinnamon_rolls,
      .innocent,
      .no,
      .snack,
      .window,
    ]
  }
}


