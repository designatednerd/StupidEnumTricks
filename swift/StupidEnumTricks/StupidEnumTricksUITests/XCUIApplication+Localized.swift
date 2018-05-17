//
//  XCUIApplication+Localized.swift
//  StupidEnumTricks
//
//  Created by Ellen Shapiro on 5/16/18.
//  Copyright © 2018 Designated Nerd Software. All rights reserved.
//

import XCTest

extension XCUIElementQuery {
  
  func withTitle(_ title: TitleLocalizable) -> XCUIElement {
    return self[title.localizedTitle.value]
  }
  
  func withContent(_ content: ContentLocalizable) -> XCUIElement {
    return self[content.localizedContent.value]
  }
  
  func withPlaceholder(_ placeholder: PlaceholderLocalizable) -> XCUIElement {
    let textFieldPredicate = NSPredicate { item, _ in
      guard let textField = item as? UITextField else { return false }
      
      return textField.placeholder == placeholder.localizedPlaceholder?.value
    }
    
    return self.element(matching: textFieldPredicate)
  }
}

extension XCUIApplication {
  
  func tapBackButton() {
    self.navigationBars.buttons["Back"].tap()
  }

  func tapButtonWithTitle(_ title: TitleLocalizable) {
    self.buttons.withTitle(title).tap()
  }
  
  func assertButtonExists(_ exists: Bool, withTitle title: TitleLocalizable) {
    XCTAssertEqual(exists, self.buttons.withTitle(title).exists)
  }
  
  func assertLabelExists(_ exists: Bool, withContent content: ContentLocalizable) {
    XCTAssertEqual(exists, self.staticTexts.withContent(content).exists)
  }
  
  func assertTextInputExists(_ exists: Bool, withInputInfo info: (TitleLocalizable & PlaceholderLocalizable)) {
    XCTAssertEqual(exists, self.staticTexts.withTitle(info).exists)
    XCTAssertEqual(exists, self.textFields.withPlaceholder(info).exists)
  }
  
  func waitForButtonWithTitle(_ title: TitleLocalizable, timeout: TimeInterval = 5) {
   
   let foundAfterWait = self.buttons.withTitle(title).waitForExistence(timeout: timeout)
    XCTAssertTrue(foundAfterWait)
  }
  
  func enterText(_ text: String, intoTextFieldWithPlaceholder placeholder: PlaceholderLocalizable) {
    self.textFields.withPlaceholder(placeholder).typeText(text)
  }
}

