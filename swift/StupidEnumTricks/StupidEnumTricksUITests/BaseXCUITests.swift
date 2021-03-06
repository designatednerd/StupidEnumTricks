//
//  BaseXCUITests.swift
//  StupidEnumTricks
//
//  Created by Ellen Shapiro on 5/17/18.
//  Copyright © 2018 Designated Nerd Software. All rights reserved.
//

import XCTest

class BaseXCUITests: XCTestCase {
  
  static var app: XCUIApplication!
  
  var app: XCUIApplication {
    return BaseXCUITests.app!
  }
  
  override func setUp() {
    super.setUp()
    
    // Only launch the app once per suite of tests. If the app
    // has already been launched, don't restart it, because that
    // takes foreeeeeeeever. Downside is that tests may fail if a
    // prior test fails, but upside is WAY less insane test run times.
    if BaseXCUITests.app == nil {
      self.relaunchApp()
    }
  }
  
  override func tearDown() {
    if !self.app.staticTexts.withContent(LandingScreenLabel.title).exists {
      // Something went wrong and we're not back at the start. Relaunch.
      self.relaunchApp()
    }
    
    super.tearDown()
  }
  
  func relaunchApp() {
    BaseXCUITests.app = XCUIApplication()
    self.app.launch()
  }
  
  func enterNewlineToMoveFrom(_ fromInput: TextInputLocalizable,
                              toInput: TextInputLocalizable?,
                              file: StaticString = #file,
                              line: UInt = #line) {
    
    self.app.assertTextInputIsActive(true,
                                     input: fromInput,
                                     file: file,
                                     line: line)
    
    self.app.enterNewline()
    
    self.app.assertTextInputIsActive(false,
                                     input: fromInput,
                                     file: file,
                                     line: line)
    
    if let toInput = toInput {
      self.app.assertTextInputIsActive(true,
                                       input: toInput,
                                       file: file,
                                       line: line)
    } // else, nothing to check for.
  }
}
