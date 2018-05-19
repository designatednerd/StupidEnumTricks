//
//  SignInViewController.swift
//  StupidEnumTricks
//
//  Created by Ellen Shapiro on 5/10/18.
//  Copyright © 2018 Designated Nerd Software. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {
  
  @IBOutlet private var emailInput: TextInputView!
  @IBOutlet private var passwordInput: TextInputView!
  
  @IBOutlet private var signInButton: UIButton!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.title = Localized.sign_in_screen_title.value
    
    self.emailInput.configure(using: SignInInput.email)
    self.emailInput.inputValidator = Validator.email
    
    self.passwordInput.configure(using: SignInInput.password)
    self.passwordInput.inputValidator = Validator.password
    
    self.signInButton.configure(with: SignInButton.signIn)
  }
  
  @IBAction private func signIn() {
    self.view.endEditing(true)
    
    self.emailInput.validateTextField()
    self.passwordInput.validateTextField()
    
    guard
      self.emailInput.inputState == .valid,
      self.passwordInput.inputState == .valid else {
        return
    }
    
    self.perform(segue: MainStoryboardSegue.toLoggedInCats)
  }
}
