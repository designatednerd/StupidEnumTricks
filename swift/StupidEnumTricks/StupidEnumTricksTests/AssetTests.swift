//
//  AssetTests.swift
//  StupidEnumTricksTests
//
//  Created by Ellen Shapiro on 5/17/18.
//  Copyright © 2018 Designated Nerd Software. All rights reserved.
//

import XCTest
@testable import StupidEnumTricks

class AssetTests: XCTestCase {
  
  func testAssetsAllExist() {
    for asset in Asset.allCases {
      XCTAssertNotNil(UIImage(named: asset.rawValue),
                      "Missing image for asset \(asset.rawValue)")
    }
  }
}


