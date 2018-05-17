//
//  ValidatorTests.swift
//  StupidEnumTricksTests
//
//  Created by Ellen Shapiro on 5/17/18.
//  Copyright © 2018 Designated Nerd Software. All rights reserved.
//

import XCTest
@testable import StupidEnumTricks

class ValidatorTests: XCTestCase {
  
  // MARK: - Email
  
  func funcTestEmailWithThreeLetterDomain() {
    let threeLetterDomainResult = Validator.email(from: "hi@hello.com")
    XCTAssertTrue(threeLetterDomainResult.isValid)
    XCTAssertNil(threeLetterDomainResult.errorMessage)
  }
  
  func testEmailWithTwoLetterDomain() {
    let twoLetterDomainResult = Validator.email(from: "ciao@ciao.it")
    XCTAssertTrue(twoLetterDomainResult.isValid)
    XCTAssertNil(twoLetterDomainResult.errorMessage)
  }
  
  func testEmailWithNilInput() {
    let nilResult = Validator.email(from: nil)
    XCTAssertFalse(nilResult.isValid)
    XCTAssertEqual(nilResult.errorMessage, Localized.error_message_field_required.value)
  }
  
  func testEmailWithEmptyInput() {
    let emptyResult = Validator.email(from: "")
    XCTAssertFalse(emptyResult.isValid)
    XCTAssertEqual(emptyResult.errorMessage, Localized.error_message_field_required.value)
  }
  
  func testEmailWithNoDomain() {
    let noDomainResult = Validator.email(from: "hi@hello.")
    XCTAssertFalse(noDomainResult.isValid)
    XCTAssertEqual(noDomainResult.errorMessage, Localized.error_message_email_invalid.value)
  }
  
  func testEmailWithNoSymbol() {
    let noAtSymbolResult = Validator.email(from: "hihello.com")
    XCTAssertFalse(noAtSymbolResult.isValid)
    XCTAssertEqual(noAtSymbolResult.errorMessage, Localized.error_message_email_invalid.value)
  }
  
  func testEmailWithNoUser() {
    let noUserResult = Validator.email(from: "@hello.com")
    XCTAssertFalse(noUserResult.isValid)
    XCTAssertEqual(noUserResult.errorMessage, Localized.error_message_email_invalid.value)
  }
  
  // MARK: - Password
  
  func testNilPassword() {
    let nilResult = Validator.password(from: nil)
    XCTAssertFalse(nilResult.isValid)
    XCTAssertEqual(nilResult.errorMessage, Localized.error_message_field_required.value)
  }
  
  func testEmptyPassword() {
    let emptyResult = Validator.password(from: "")
    XCTAssertFalse(emptyResult.isValid)
    XCTAssertEqual(emptyResult.errorMessage, Localized.error_message_field_required.value)
  }
  
  func testTooShortPasswords() {
    var password = "d"
    
    while password.count < Validator.passwordMinimumCharacters {
      let tooShortResult = Validator.password(from: password)
      XCTAssertFalse(tooShortResult.isValid)
      XCTAssertEqual(tooShortResult.errorMessage, Localized.error_format_password_too_short.formattedValue(with: Validator.passwordMinimumCharacters))
      password += "d"
    }
  }
  
  func testValidPassword() {
    var password = ""
    for _ in 0..<Validator.passwordMinimumCharacters {
      password += "d"
    }
    
    XCTAssertEqual(password.count, Validator.passwordMinimumCharacters)
    
    let successResult = Validator.password(from: password)
    XCTAssertTrue(successResult.isValid)
    XCTAssertNil(successResult.errorMessage)
  }

  // MARK: - Password Confirmation
  
  func testIdenticalPasswords() {
    let password = "foo"
    
    let identicalPasswordResult = Validator.confirmPassword(from: password, with: password)
    XCTAssertTrue(identicalPasswordResult.isValid)
    XCTAssertNil(identicalPasswordResult.errorMessage)
  }
  
  func testNilConfirmPassword() {
    let nilConfirmationResult = Validator.confirmPassword(from: nil, with: "foo")
    XCTAssertFalse(nilConfirmationResult.isValid)
    XCTAssertEqual(Localized.error_message_field_required.value, nilConfirmationResult.errorMessage)
  }
  
  func testCaseDifferences() {
    let password = "foo"
    let capitalizedConfrirmationResult = Validator.confirmPassword(from: password.capitalized, with: password)
    XCTAssertFalse(capitalizedConfrirmationResult.isValid)
    XCTAssertEqual(capitalizedConfrirmationResult.errorMessage, Localized.error_message_passwords_dont_match.value)
 
    let capitalizedInitialResult = Validator.confirmPassword(from: password, with: password.capitalized)
    XCTAssertFalse(capitalizedInitialResult.isValid)
    XCTAssertEqual(capitalizedInitialResult.errorMessage, Localized.error_message_passwords_dont_match.value)
  }
}
