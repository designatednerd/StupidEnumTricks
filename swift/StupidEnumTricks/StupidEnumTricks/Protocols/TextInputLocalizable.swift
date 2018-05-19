//
//  TextInputLocalizable.swift
//  StupidEnumTricks
//
//  Created by Ellen Shapiro on 5/18/18.
//  Copyright © 2018 Designated Nerd Software. All rights reserved.
//

import Foundation

protocol TextInputLocalizable: (TitleLocalizable & PlaceholderLocalizable) {
  
  var isSecure: Bool { get }
}
