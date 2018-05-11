//
//  LegaleseViewController.swift
//  StupidEnumTricks
//
//  Created by Ellen Shapiro on 5/10/18.
//  Copyright © 2018 Designated Nerd Software. All rights reserved.
//

public enum LegaleseButton {
  case accept
  case reject
  
  var localizedTitle: String {
    switch self {
    case .accept:
      return NSLocalizedString("Accept Terms", comment: "Title of button to accept legalese they probably haven't read")
    case .reject:
      return NSLocalizedString("Reject Terms", comment: "Title to reject legalese because they probably actually read it and are horrified")
    }
  }
}

import UIKit

class LegaleseVewController: UIViewController {
  
  @IBOutlet private var titleLabel: UILabel!
  @IBOutlet private var termsLabel: UILabel!
  
  @IBOutlet private var acceptButton: UIButton!
  @IBOutlet private var rejectButton: UIButton!

  
  @IBAction private func acceptTerms() {
    
  }
  
  @IBAction private func rejectTerms() {
    
  }
}
