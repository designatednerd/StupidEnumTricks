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
  
  func withLocalized(_ localized: Localized) -> XCUIElement {
    return self[localized.value]
  }
  
  fileprivate func withString(_ string: String) -> XCUIElement {
    return self[string]
  }
  
  fileprivate static func placeholderPredicate(for placeholder: PlaceholderLocalizable) -> NSPredicate {
    return NSPredicate { item, _ in
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
  }
  
  fileprivate static func childWithValuePredicate(_ value: String) -> NSPredicate {
    return NSPredicate { item, _ in
      guard let anything = item as? NSObject  else {
        return false
      }
      
      guard let children = anything.value(forKey: "children") as? [NSObject] else {
        return false
      }
      
      return children.contains(where: { object in
        object.value(forKey: "label") as? String == value
      })
    }
  }
  
  fileprivate static func childWithPlaceholderPredicate(for placeholder: PlaceholderLocalizable) -> NSPredicate {
    return NSPredicate { item, _ in
      guard let anything = item as? NSObject  else {
        return false
      }
      
      guard let children = anything.value(forKey: "children") as? [NSObject] else {
        return false
      }
      
      guard let value = placeholder.localizedPlaceholder?.value else {
        assertionFailure("Don't use this when there's no value for the placeholder")
        return false
      }
      
      return children.contains(where: { object in
        object.value(forKey: "placeholderValue") as? String == value
      })
    }
  }
  
  func withPlaceholder(_ placeholder: PlaceholderLocalizable) -> XCUIElement {
    let predicate = XCUIElementQuery.placeholderPredicate(for: placeholder)
    return self.element(matching: predicate)
  }
}

extension XCUIElement {
  
  var hasKeyboardFocus: Bool {
    guard let focused = self.value(forKey: "hasKeyboardFocus") as? Bool else {
      return false
    }
    
    return focused
  }
  
}

extension XCUIApplication {
  
  private func textFieldForInput(_ input: TextInputLocalizable) -> XCUIElement {
    if input.isSecure {
      return self.secureTextFields.withPlaceholder(input)
    } else {
      return self.textFields.withPlaceholder(input)
    }
  }
  
  func input(_ input: TextInputLocalizable) -> XCUIElement {
    let childWithPlaceholderPredicate = XCUIElementQuery.childWithPlaceholderPredicate(for: input)
    
    let childWithTitlePredicate = XCUIElementQuery.childWithValuePredicate(input.localizedTitle.value)
    
    let compound = NSCompoundPredicate(andPredicateWithSubpredicates: [childWithPlaceholderPredicate, childWithTitlePredicate])
    
    return self.otherElements.element(matching: compound)
  }
  
  func tapBackButton() {
    self.navigationBars.buttons["Back"].tap()
  }

  func tapButtonWithTitle(_ title: TitleLocalizable) {
    self.buttons.withTitle(title).tap()
  }
  
  func selectTextInput(_ input: TextInputLocalizable,
                       file: StaticString = #file,
                       line: UInt = #line) {
    self.textFieldForInput(input).tap()
    self.assertTextInputIsActive(true,
                                 input: input,
                                 file: file,
                                 line: line)
  }
  
  func assertButtonExists(_ exists: Bool,
                          withTitle title: TitleLocalizable,
                          file: StaticString = #file,
                          line: UInt = #line) {
    XCTAssertEqual(exists,
                   self.buttons.withTitle(title).exists,
                   file: file,
                   line: line)
  }
  
  func assertLabelExists(_ exists: Bool,
                         withContent content: ContentLocalizable,
                         file: StaticString = #file,
                         line: UInt = #line) {
    XCTAssertEqual(exists,
                   self.staticTexts.withContent(content).exists,
                   file: file,
                   line: line)
  }
  
  func assertLabelExists(_ exists: Bool,
                         for localized: Localized,
                         file: StaticString = #file,
                         line: UInt = #line) {
    XCTAssertEqual(exists,
                   self.staticTexts.withLocalized(localized).exists,
                   file: file,
                   line: line)
  }
  
  func assertTextInputExists(_ exists: Bool,
                             input: TextInputLocalizable,
                             file: StaticString = #file,
                             line: UInt = #line) {
    XCTAssertEqual(exists,
                   self.input(input).exists,
                   file: file,
                   line: line)
  }
  
  func assertTextInput(_ input: TextInputLocalizable,
                       displayingLocalizedMessage message: Localized,
                       file: StaticString = #file,
                       line: UInt = #line) {
    self.assertTextInput(input,
                         displayingMessage: message.value,
                         file: file,
                         line: line)
  }
  
  func assertTextInput(_ input: TextInputLocalizable,
                       displayingMessage message: String,
                       file: StaticString = #file,
                       line: UInt = #line) {
    
    let textInput = self.input(input)
    XCTAssertTrue(textInput.exists,
                  file: file,
                  line: line)
    
    XCTAssertTrue(textInput.staticTexts[message].exists,
                  file: file,
                  line: line)
  }
  
  func waitForButtonWithTitle(_ title: TitleLocalizable,
                              timeout: TimeInterval = 5,
                              file: StaticString = #file,
                              line: UInt = #line) {
   
    let foundAfterWait = self.buttons.withTitle(title).waitForExistence(timeout: timeout)
    XCTAssertTrue(foundAfterWait,
                  file: file,
                  line: line)
  }
  
  func waitForNavigationBarTitle(_ title: Localized,
                                 timeout: TimeInterval = 5,
                                 file: StaticString = #file,
                                 line: UInt = #line) {
    let foundAfterWait = self.navigationBars[title.value].waitForExistence(timeout: timeout)
    XCTAssertTrue(foundAfterWait,
                  file: file,
                  line: line)
  }
  
  func enterText(_ text: String,
                 intoInput input: TextInputLocalizable) {
    
    self.textFieldForInput(input).typeText(text)
  }
  
  func enterNewline() {
    self.typeText("\n")
  }
  
  func assertTextInputIsActive(_ active: Bool,
                               input: TextInputLocalizable,
                               isSecure: Bool = false,
                               file: StaticString = #file,
                               line: UInt = #line) {
    let textInput = self.textFieldForInput(input)
    XCTAssertEqual(active,
                   textInput.hasKeyboardFocus,
                   file: file,
                   line: line)
  }
  }
}

