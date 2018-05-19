//
//  SignInUITests.swift
//  StupidEnumTricks
//
//  Created by Ellen Shapiro on 5/18/18.
//  Copyright © 2018 Designated Nerd Software. All rights reserved.
//

import XCTest

class SignInUITests: BaseXCUITests {
  
  override func setUp() {
    super.setUp()
    
    self.app.tapButtonWithTitle(LandingScreenButton.signIn)
    self.app.waitForNavigationBarTitle(.sign_in_screen_title)
  }

  func testValidInputAllowsSignInAndGoesToAdorableCats() {
    self.app.selectTextInput(SignInInput.email)
    self.app.enterText("my@email.com", intoInput: SignInInput.email)

    self.enterNewlineToMoveFrom(SignInInput.email,
                                toInput: SignInInput.password)

    self.app.enterText("password", intoInput: SignInInput.password)
    
    self.enterNewlineToMoveFrom(SignInInput.password,
                                toInput: nil)
    
    self.app.tapButtonWithTitle(SignInButton.signIn)
    self.app.tapButtonWithTitle(AdorableCatButton.signOut)

    self.app.assertLabelExists(true, withContent: LandingScreenLabel.title)
  }
  
  func testValidEmailWithInvalidPasswordCausesError() {
    self.app.selectTextInput(SignInInput.email)
    self.app.enterText("my@email.com", intoInput: SignInInput.email)
    
    self.enterNewlineToMoveFrom(SignInInput.email,
                                toInput: SignInInput.password)
    
    self.app.enterText("nope",
                       intoInput: SignInInput.password)
    
    self.app.tapButtonWithTitle(SignInButton.signIn)
    
    let errorMessage = Localized.error_format_password_too_short.formattedValue(with: Validator.passwordMinimumCharacters)
    self.app.assertTextInput(SignInInput.password, displayingMessage: errorMessage)

    self.app.tapBackButton()
  }
  
  func testInvalidEmailWithInvalidPasswordCausesTwoErrors() {
    self.app.selectTextInput(SignInInput.email)
    self.app.enterText("notanemail", intoInput: SignInInput.email)
    
    self.enterNewlineToMoveFrom(SignInInput.email,
                                toInput: SignInInput.password)
    
    self.app.enterText("nope", intoInput: SignInInput.password)
    
    self.app.tapButtonWithTitle(SignInButton.signIn)
    
    self.app.assertTextInput(SignInInput.email,
                             displayingLocalizedMessage: .error_message_email_invalid)
    
    let passwordErrorMessage = Localized.error_format_password_too_short.formattedValue(with: Validator.passwordMinimumCharacters)
    self.app.assertTextInput(SignInInput.password,
                             displayingMessage: passwordErrorMessage)
    
    self.app.tapBackButton()
  }
  
  func testEmptyEmailWithValidPasswordCausesError() {
    self.app.selectTextInput(SignInInput.password)
    self.app.enterText("password", intoInput: SignInInput.password)
    
    self.app.tapButtonWithTitle(SignInButton.signIn)
    
    self.app.assertTextInput(SignInInput.email,
                             displayingLocalizedMessage: .error_message_field_required)
    
    self.app.tapBackButton()
  }
}
