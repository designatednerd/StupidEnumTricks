//
//  Validator.swift
//  StupidEnumTricks
//
//  Created by Ellen Shapiro on 5/15/18.
//  Copyright © 2018 Designated Nerd Software. All rights reserved.
//

import Foundation

struct ValidationResult {
  let isValid: Bool
  let errorMessage: String?
  
  fileprivate init(isValid: Bool,
                   errorMessage: String? = nil) {
    self.isValid = isValid
    self.errorMessage = errorMessage
  }
  
  static func valid() -> ValidationResult {
    return ValidationResult(isValid: true)
  }
  
  
  static func invalid(localizedErrorMessage: Localized) -> ValidationResult {
    return ValidationResult(isValid: false,
                            errorMessage: localizedErrorMessage.value)
  }
  
  static func invalid(errorMessage: String) -> ValidationResult {
    return ValidationResult(isValid: false, errorMessage: errorMessage)
  }
}

struct Validator {
  
  static let passwordMinimumCharacters = 6

  static func email(from string: String?) -> ValidationResult {
    guard
      let emailString = string,
      !emailString.isEmpty else {
        return .invalid(localizedErrorMessage:.error_message_field_required)
    }
    
    guard emailString.contains("@") else {
      return .invalid(localizedErrorMessage: .error_message_email_invalid)
    }
    
    let pieces = emailString.components(separatedBy: "@")
    guard
      pieces.count == 2,
      let address = pieces.first,
      !address.isEmpty,
      let domain = pieces.last,
      !domain.isEmpty,
      domain.contains(".") else {
        return .invalid(localizedErrorMessage: .error_message_email_invalid)
    }
    
    let domainPieces = domain.components(separatedBy: ".")
    guard
      domainPieces.count >= 2,
      domainPieces.first(where: { $0.isEmpty }) == nil else {
        return .invalid(localizedErrorMessage: .error_message_email_invalid)
    }
    
    return .valid()
  }
  
  static func password(from string: String?) -> ValidationResult {
    guard
      let passwordString = string,
      !passwordString.isEmpty else {
        return .invalid(localizedErrorMessage: .error_message_field_required)
    }
    
    guard passwordString.count >= self.passwordMinimumCharacters else {
      let errorMessage = Localized.error_format_password_too_short.formattedValue(with: self.passwordMinimumCharacters)
      return .invalid(errorMessage: errorMessage)
    }

    return .valid()
  }
  
  static func confirmPassword(from string: String?, with original: String) -> ValidationResult {
    guard let confirmationString = string else {
      return .invalid(localizedErrorMessage: .error_message_field_required)
    }
    
    guard confirmationString == original else {
      return .invalid(localizedErrorMessage: .error_message_passwords_dont_match)
    }
    
    return .valid()
  }
}
