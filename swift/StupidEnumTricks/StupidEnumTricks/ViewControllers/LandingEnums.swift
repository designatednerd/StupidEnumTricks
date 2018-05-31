//
//  LandingEnums.swift
//  StupidEnumTricks
//
//  Created by Ellen Shapiro on 5/16/18.
//  Copyright © 2018 Designated Nerd Software. All rights reserved.
//

import Foundation

eb


enum LandingScreenButton {
  case signIn
  case signUp
  case viewTerms
}

extension LandingScreenButton: TitleLocalizable {
  var localizedTitle: Localized {
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

enum LandingScreenLabel {
  case title
}

extension LandingScreenLabel: ContentLocalizable {
  
  var localizedContent: Localized {
    switch self {
    case .title:
      return .landing_screen_title
    }
  }
}
