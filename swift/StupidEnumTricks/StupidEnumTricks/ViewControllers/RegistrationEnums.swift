//
//  RegistrationEnums.swift
//  StupidEnumTricks
//
//  Created by Ellen Shapiro on 5/17/18.
//  Copyright © 2018 Designated Nerd Software. All rights reserved.
//

import Foundation

enum RegistrationInput {
  case email
  case password
  case confirmPassword
}

extension RegistrationInput: TextInputLocalizable {
  
  var localizedTitle: Localized {
    switch self {
    case .email:
      return .input_title_email
    case .password:
      return .input_title_password
    case .confirmPassword:
      return .input_title_password_confirm
    }
  }
  
  var localizedPlaceholder: Localized? {
    switch self {
    case .email:
      return .input_placeholder_email
    case .password,
         .confirmPassword:
      return .input_placeholder_password
    }
  }
  
  var isSecure: Bool {
    switch self {
    case .email:
      return false
    case .password,
         .confirmPassword:
      return true
    }
  }
}

enum RegistrationButton {
  case signUp
}

extension RegistrationButton: TitleLocalizable {
  
  var localizedTitle: Localized {
    switch self {
    case .signUp:
      return .button_title_sign_up
    }
  }
}
