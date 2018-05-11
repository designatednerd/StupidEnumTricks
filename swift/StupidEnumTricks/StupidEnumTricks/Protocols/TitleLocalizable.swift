//
//  TitleLocalizable.swift
//  StupidEnumTricks
//
//  Created by Ellen Shapiro on 5/10/18.
//  Copyright © 2018 Designated Nerd Software. All rights reserved.
//

import UIKit

protocol TitleLocalizable {
  var localizedTitle: String { get }
}

extension UIButton {
  
  func configure<T: TitleLocalizable>(with localizable: T) {
    self.setTitle(localizable.localizedTitle, for: .normal)
  }
}
