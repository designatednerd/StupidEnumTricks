//
//  LandingViewController.swift
//  StupidEnumTricks
//
//  Created by Ellen Shapiro on 5/10/18.
//  Copyright © 2018 Designated Nerd Software. All rights reserved.
//

import UIKit

public enum LandingScreenButton: TitleLocalizable {
  case signIn
  case signUp
  case viewTerms
  
  public var localizedTitle: String {
    switch self {
    case .signIn:
      return NSLocalizedString("Sign In",
                               comment: "Sign in button title")
    case .signUp:
      return NSLocalizedString("Sign Up",
                               comment: "Sign up button title")
    case .viewTerms:
      return NSLocalizedString("View Terms & Conditions",
                               comment:  "Title for button to view legalese")
    }
  }
}

class LandingViewController: UIViewController {
  
  @IBOutlet private var signInButton: UIButton!
  @IBOutlet private var signUpButton: UIButton!
  @IBOutlet private var termsButton: UIButton!

  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.signInButton.configure(with: LandingScreenButton.signIn)
    self.signUpButton.configure(with: LandingScreenButton.signUp)
    self.termsButton.configure(with: LandingScreenButton.viewTerms)
  }

  @IBAction private func showTerms() {
    perform(segue: MainStoryboardSegue.toTerms)
  }
  
  @IBAction private func showSignIn() {
    perform(segue: MainStoryboardSegue.toSignIn)
  }

  @IBAction private func showSignUp() {
    perform(segue: MainStoryboardSegue.toSignUp)
  }
}

