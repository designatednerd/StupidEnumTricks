//
//  SplashScreenUITests.swift
//  StupidEnumTricksUITests
//
//  Created by Ellen Shapiro on 5/15/18.
//  Copyright © 2018 Designated Nerd Software. All rights reserved.
//

import XCTest

class SplashScreenUITests: BaseXCUITests {
  
  func testTappingSignInGoesToCorrectPlace() {
    self.app.tapButtonWithTitle(LandingScreenButton.signIn)

    self.app.waitForNavigationBarTitle(.sign_in_screen_title)
    
    self.app.assertTextInputExists(true, withInputInfo: SignInInput.email)
    
    self.app.tapBackButton()
  }
  
  func testTappingSignUpGoesToCorrectPlace() {
    self.app.tapButtonWithTitle(LandingScreenButton.signUp)
    self.app.assertTextInputExists(true, withInputInfo: RegistrationInput.confirmPassword)
    
    self.app.tapBackButton()
  }
  
  func testTappingTermsGoesToCorrectPlace() {
    self.app.tapButtonWithTitle(LandingScreenButton.viewTerms)
    self.app.assertLabelExists(true, withContent: LegaleseLabel.title)
    
    // Relaunch app since you can't cancel out of this
    self.relaunchApp()
  }
}
