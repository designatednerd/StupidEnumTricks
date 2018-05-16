//
//  AdorableCatViewController.swift
//  StupidEnumTricks
//
//  Created by Ellen Shapiro on 5/15/18.
//  Copyright © 2018 Designated Nerd Software. All rights reserved.
//

import UIKit

public enum AdorableCatButton {
  case signOut
}

extension AdorableCatButton: TitleLocalizable {
  
  public var localizedTitle: Localized {
    switch self {
    case .signOut:
      return .button_title_sign_out
    }
  }
}

class AdorableCatViewController: UIViewController {
  
  @IBOutlet private var catImageView: UIImageView!
  @IBOutlet private var signOutButton: UIButton!
  
  var shouldShowSignOutButton: Bool = true
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.signOutButton.configure(with: AdorableCatButton.signOut)
    self.signOutButton.isHidden = !self.shouldShowSignOutButton
    
    // Put a cat on it
    let asset = Asset.allCases.randomElement
    self.catImageView.image = asset.image
  }
  
  @IBAction private func signOut() {
    if let nav = self.presentingViewController as? UINavigationController {
      nav.popToRootViewController(animated: false)
    }
    self.dismiss(animated: true)
  }
}
