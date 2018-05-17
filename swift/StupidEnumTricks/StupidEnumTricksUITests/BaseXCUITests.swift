//
//  BaseXCUITests.swift
//  StupidEnumTricks
//
//  Created by Ellen Shapiro on 5/17/18.
//  Copyright © 2018 Designated Nerd Software. All rights reserved.
//

import XCTest

class BaseXCUITests: XCTestCase {
  
  var app: XCUIApplication!
  
  override func setUp() {
    super.setUp()
    
    // Only launch the app once per suite of tests. If the app
    // has already been launched, don't restart it, because that
    // takes foreeeeeeeever. Downside is that tests may fail if a
    // prior test fails, but upside is WAY less insane test run times.
    if self.app == nil {
      self.relaunchApp()
    }
  }
  
  func relaunchApp() {
    self.app = XCUIApplication()
    self.app.launch()
  }
}
