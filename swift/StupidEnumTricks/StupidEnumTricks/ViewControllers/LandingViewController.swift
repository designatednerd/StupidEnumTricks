//
//  LandingViewController.swift
//  StupidEnumTricks
//
//  Created by Ellen Shapiro on 5/10/18.
//  Copyright © 2018 Designated Nerd Software. All rights reserved.
//

import UIKit

class LandingViewController: UIViewController {
  
  @IBOutlet private var landingTitleLabel: UILabel!
  
  @IBOutlet private var signInButton: UIButton!
  @IBOutlet private var signUpButton: UIButton!
  @IBOutlet private var termsButton: UIButton!

  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.signInButton.configure(with: LandingScreenButton.signIn)
    self.signUpButton.configure(with: LandingScreenButton.signUp)
    self.termsButton.configure(with: LandingScreenButton.viewTerms)
    
    self.landingTitleLabel.configure(with: LandingScreenLabel.title)
  }
}
