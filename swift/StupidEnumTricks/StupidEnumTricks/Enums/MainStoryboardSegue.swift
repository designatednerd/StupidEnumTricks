//
//  MainStoryboardSegue.swift
//  StupidEnumTricks
//
//  Created by Ellen Shapiro on 5/10/18.
//  Copyright © 2018 Designated Nerd Software. All rights reserved.
//

import UIKit

enum MainStoryboardSegue: String, SeguePerforming {
  case toCats
  case toLoggedInCats
  case toSignIn
  case toSignUp
  case toTerms
  
  init?(from segue: UIStoryboardSegue) {
    guard let identifier = segue.identifier else {
      return nil
    }
    
    self.init(rawValue: identifier)
  }
}
