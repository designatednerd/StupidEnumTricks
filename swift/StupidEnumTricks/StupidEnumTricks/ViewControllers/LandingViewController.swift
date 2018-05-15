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
  
  public var localizedTitle: Localized {
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

