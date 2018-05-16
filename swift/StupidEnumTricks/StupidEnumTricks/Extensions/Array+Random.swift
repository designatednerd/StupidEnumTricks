//
//  Array+Random.swift
//  StupidEnumTricks
//
//  Created by Ellen Shapiro on 5/15/18.
//  Copyright © 2018 Designated Nerd Software. All rights reserved.
//

import Foundation

extension Array {
  
  var randomElement: Element {
    let randomIndex = Int(arc4random_uniform(UInt32(self.count - 1)))
    return self[randomIndex]
  }
  
}
