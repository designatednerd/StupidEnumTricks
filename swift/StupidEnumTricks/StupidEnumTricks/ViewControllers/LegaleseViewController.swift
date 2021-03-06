//
//  LegaleseViewController.swift
//  StupidEnumTricks
//
//  Created by Ellen Shapiro on 5/10/18.
//  Copyright © 2018 Designated Nerd Software. All rights reserved.
//

import UIKit

class LegaleseVewController: UIViewController {
  
  @IBOutlet private var titleLabel: UILabel!
  @IBOutlet private var termsLabel: UILabel!
  
  @IBOutlet private var acceptButton: UIButton!
  @IBOutlet private var rejectButton: UIButton!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.acceptButton.configure(with: LegaleseButton.accept)
    self.rejectButton.configure(with: LegaleseButton.reject)
    
    self.titleLabel.configure(with: LegaleseLabel.title)
    self.termsLabel.configure(with: LegaleseLabel.terms)
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    guard
      let mainSegue = MainStoryboardSegue(from: segue),
      mainSegue == .toCats else {
        return 
    }
  }

  @IBAction private func acceptTerms() {
    self.showOKAlert(localizedTitle: .terms_accepted_alert_title,
                     localizedMessage: .terms_accepted_alert_message)
  }
  
  @IBAction private func rejectTerms() {
    self.showOKAlert(localizedTitle: .terms_rejected_alert_title,
                     localizedMessage: .terms_rejected_alert_message,
                     okActionHandler: { [weak self] _ in
                      self?.perform(segue: MainStoryboardSegue.toCats)
                     })
  }
}
