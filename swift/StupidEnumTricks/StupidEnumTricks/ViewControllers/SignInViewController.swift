//
//  SignInViewController.swift
//  StupidEnumTricks
//
//  Created by Ellen Shapiro on 5/10/18.
//  Copyright © 2018 Designated Nerd Software. All rights reserved.
//

import UIKit

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

class SignInViewController: UIViewController {
  
  @IBOutlet private var emailInput: TextInputView!
  @IBOutlet private var passwordInput: TextInputView!
  
  @IBOutlet private var signInButton: UIButton!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.emailInput.configure(using: SignInInput.email)
    self.emailInput.inputValidator = Validator.email
    
    self.passwordInput.configure(using: SignInInput.password)
    self.passwordInput.inputValidator = Validator.password
    
    self.signInButton.configure(with: SignInButton.signIn)
  }
  
  @IBAction private func signIn() {
    self.view.endEditing(true)
    
    guard
      self.emailInput.inputState == .valid,
      self.passwordInput.inputState == .valid else {
        return
    }
  }
}
