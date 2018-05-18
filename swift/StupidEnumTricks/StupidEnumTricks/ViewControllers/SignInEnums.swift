//
//  SignInEnums.swift
//  StupidEnumTricks
//
//  Created by Ellen Shapiro on 5/16/18.
//  Copyright © 2018 Designated Nerd Software. All rights reserved.
//

import Foundation

enum SignInInput {
  case email
  case password
}

extension SignInInput: TitleLocalizable {
  var localizedTitle: Localized {
    switch self {
    case .email:
      return .input_title_email
    case .password:
      return .input_title_password
    }
  }
}

extension SignInInput: PlaceholderLocalizable {
  var localizedPlaceholder: Localized? {
    switch self {
    case .email:
      return .input_placeholder_email
    case .password:
      return .input_placeholder_password
    }
  }
}

enum SignInButton {
  case signIn
}

extension SignInButton: TitleLocalizable {
  
  var localizedTitle: Localized {
    switch self {
    case .signIn:
      return .button_title_sign_in
    }
  }
}
