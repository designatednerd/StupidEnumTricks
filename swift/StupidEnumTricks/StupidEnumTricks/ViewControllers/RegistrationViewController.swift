//
//  RegistrationViewController.swift
//  StupidEnumTricks
//
//  Created by Ellen Shapiro on 5/10/18.
//  Copyright © 2018 Designated Nerd Software. All rights reserved.
//

import UIKit

class RegistrationViewController: UIViewController {
  
  @IBOutlet private var emailInput: TextInputView!
  @IBOutlet private var passwordInput: TextInputView!
  @IBOutlet private var passwordConfirmInput: TextInputView!
  
  @IBOutlet private var signUpButton: UIButton!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.emailInput.configure(using: RegistrationInput.email)
    self.emailInput.inputValidator = Validator.email
    
    self.passwordInput.configure(using: RegistrationInput.password)
    self.passwordInput.inputValidator = Validator.password
    
    self.passwordConfirmInput.configure(using: RegistrationInput.confirmPassword)
    self.passwordConfirmInput.inputValidator = { [weak self] string in
      guard let original = self?.passwordInput.text else {
        return ValidationResult.invalid(localizedErrorMessage: .error_message_field_required)
      }
      
      return Validator.confirmPassword(from: string, with: original)
    }
    
    self.signUpButton.configure(with: RegistrationButton.signUp)
  }
  
  @IBAction private func signUp() {
    self.view.endEditing(true)
    
    self.emailInput.validateTextField()
    self.passwordInput.validateTextField()
    self.passwordConfirmInput.validateTextField()
  
    guard
      self.emailInput.inputState == .valid,
      self.passwordInput.inputState == .valid,
      self.passwordConfirmInput.inputState == .valid else {
        return
    }
    
    self.perform(segue: MainStoryboardSegue.toLoggedInCats)
  }
}
