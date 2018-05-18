//
//  LegaleseEnums.swift
//  StupidEnumTricks
//
//  Created by Ellen Shapiro on 5/17/18.
//  Copyright © 2018 Designated Nerd Software. All rights reserved.
//

import Foundation

enum LegaleseButton {
  case accept
  case reject
}

extension LegaleseButton: TitleLocalizable {
  
  var localizedTitle: Localized {
    switch self {
    case .accept:
      return .button_title_terms_accept
    case .reject:
      return .button_title_terms_reject
    }
  }
}

enum LegaleseLabel {
  case title
  case terms
}

extension LegaleseLabel: ContentLocalizable {
  
  var localizedContent: Localized {
    switch self {
    case .title:
      return .terms_title
    case .terms:
      return .terms_legalese
    }
  }
}
