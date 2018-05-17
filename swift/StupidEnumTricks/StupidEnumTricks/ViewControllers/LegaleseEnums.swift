//
//  LegaleseEnums.swift
//  StupidEnumTricks
//
//  Created by Ellen Shapiro on 5/17/18.
//  Copyright © 2018 Designated Nerd Software. All rights reserved.
//

import Foundation

public enum LegaleseButton {
  case accept
  case reject
}

extension LegaleseButton: TitleLocalizable {
  
  public var localizedTitle: Localized {
    switch self {
    case .accept:
      return .button_title_terms_accept
    case .reject:
      return .button_title_terms_reject
    }
  }
}

public enum LegaleseLabel {
  case title
  case terms
}

extension LegaleseLabel: ContentLocalizable {
  
  public var localizedContent: Localized {
    switch self {
    case .title:
      return .terms_title
    case .terms:
      return .terms_legalese
    }
  }
}
