//
//  AdorableCatEnums.swift
//  StupidEnumTricks
//
//  Created by Ellen Shapiro on 5/18/18.
//  Copyright © 2018 Designated Nerd Software. All rights reserved.
//

import Foundation

enum AdorableCatButton {
  case signOut
}

extension AdorableCatButton: TitleLocalizable {
  
  var localizedTitle: Localized {
    switch self {
    case .signOut:
      return .button_title_sign_out
    }
  }
}
