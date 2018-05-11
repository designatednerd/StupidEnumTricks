//
//  ContentLocalizable.swift
//  StupidEnumTricks
//
//  Created by Ellen Shapiro on 5/10/18.
//  Copyright © 2018 Designated Nerd Software. All rights reserved.
//

import UIKit

protocol ContentLocalizable {
  var localizedContent: String { get }
}

extension UILabel {
  func configure<T: ContentLocalizable>(with localizable: T) {
    self.text = localizable.localizedContent
  }
}

extension UITextView {

  func configure<T: ContentLocalizable>(with localizable: T) {
    self.text = localizable.localizedContent
  }
}
