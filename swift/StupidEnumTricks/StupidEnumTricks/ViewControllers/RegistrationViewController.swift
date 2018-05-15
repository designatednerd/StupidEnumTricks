//
//  RegistrationViewController.swift
//  StupidEnumTricks
//
//  Created by Ellen Shapiro on 5/10/18.
//  Copyright © 2018 Designated Nerd Software. All rights reserved.
//

import UIKit

public enum RegistrationInput {
  case email
  case password
  case confirmPassword
}

extension RegistrationInput: TitleLocalizable {
  public var localizedTitle: Localized {
    switch self {
    case .email:
      return .input_title_email
    case .password:
      return .input_title_password
    case .confirmPassword:
      return .input_title_password_confirm
    }
  }
}

extension RegistrationInput: PlaceholderLocalizable {
  public var localizedPlaceholder: Localized? {
    switch self {
    case .email:
      return .input_placeholder_email
    case .password,
         .confirmPassword:
      return .input_placeholder_password
    }
  }
}

public enum RegistrationButton {
  case signUp
}

extension RegistrationButton: TitleLocalizable {
  
  public var localizedTitle: Localized {
    switch self {
    case .signUp:
      return .button_title_sign_up
    }
  }
}

class RegistrationViewController: UIViewController {
  
  @IBOutlet private var emailInput: TextInputView!
  @IBOutlet private var passwordInput: TextInputView!
  @IBOutlet private var passwordConfirmInput: TextInputView!
  
  @IBOutlet private var signUpButton: UIButton!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.emailInput.configure(using: RegistrationInput.email)
    self.passwordInput.configure(using: RegistrationInput.password)
    self.passwordConfirmInput.configure(using: RegistrationInput.confirmPassword)
    self.signUpButton.configure(with: RegistrationButton.signUp)
  }
  
