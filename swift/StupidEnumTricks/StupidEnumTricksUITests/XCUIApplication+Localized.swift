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
    let predicate = NSPredicate { item, _ in
      // This actually returns an XCElementSnapshot, which is framework-private. From the class-dumped headers:
      // https://github.com/orta/XCTest-Public-Headers/blob/master/Developer/Platforms/iPhoneOS.platform/Developer/Library/Frameworks/XCTest.framework/XCTest/XCElementSnapshot.h
      // You can see that it's an NSObject subclass. So let's at least get that far:
      guard let anything = item as? NSObject  else {
          return false
      }
      
      // You can also see from the class-dumped headers that there's a
      // `placeholderValue` property on `XCElementSnapshot`. From logging,
      // you can tell that this is where the placeholder on a text field lives. Therefore:
      guard let placeholderValue = anything.value(forKey: "placeholderValue") as? String else {
        // If there's no value, but your passed in placeholder is also nil, you're good.
        return (placeholder.localizedPlaceholder == nil)
      }
      
      guard let localizedPlaceholder = placeholder.localizedPlaceholder?.value else {
        // There was a value, but there's no localized placeholder. That doesn't match.
        return false
      }

      // Holy hell, an actual value comparison!
      return placeholderValue == localizedPlaceholder
    }
    
    return self.element(matching: predicate)
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
  
  func waitForNavigationBarTitle(_ title: Localized, timeout: TimeInterval = 5) {
    let foundAfterWait = self.navigationBars[title.value].waitForExistence(timeout: timeout)
    XCTAssertTrue(foundAfterWait)
  }
  
  func enterText(_ text: String, intoTextFieldWithPlaceholder placeholder: PlaceholderLocalizable) {
    self.textFields.withPlaceholder(placeholder).typeText(text)
  }
}

