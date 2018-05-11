//
//  UILabel+Content.swift
//  StupidEnumTricks
//
//  Created by Ellen Shapiro on 5/11/18.
//  Copyright © 2018 Designated Nerd Software. All rights reserved.
//

import UIKit

extension UILabel {
  
  var hasContent: Bool {
    guard
      let text = self.text,
      !text.isEmpty else {
        return false
    }
    
    return true
  }
  
  func updateHiddenFromContent() {
    self.isHidden = !self.hasContent
  }
}
