//
//  ContentLocalizable.swift
//  StupidEnumTricks
//
//  Created by Ellen Shapiro on 5/10/18.
//  Copyright © 2018 Designated Nerd Software. All rights reserved.
//

import UIKit

public protocol ContentLocalizable {
  var localizedContent: Localized { get }
}

extension UILabel {
  func configure<T: ContentLocalizable>(with localizable: T) {
    self.text = localizable.localizedContent.value
  }
}

extension UITextView {

  func configure<T: ContentLocalizable>(with localizable: T) {
    self.text = localizable.localizedContent.value
  }
}
