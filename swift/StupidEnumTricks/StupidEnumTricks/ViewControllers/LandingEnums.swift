//
//  LandingEnums.swift
//  StupidEnumTricks
//
//  Created by Ellen Shapiro on 5/16/18.
//  Copyright © 2018 Designated Nerd Software. All rights reserved.
//

import Foundation

public enum LandingScreenButton: TitleLocalizable {
  case signIn
  case signUp
  case viewTerms

  public var localizedTitle: Localized {
    switch self {
    case .signIn:
      return .button_title_sign_in
    case .signUp:
      return .button_title_sign_up
    case .viewTerms:
      return .button_title_view_terms
    }
  }
}
