//
//  UIViewController+AlertConvenience.swift
//  StupidEnumTricks
//
//  Created by Ellen Shapiro on 5/15/18.
//  Copyright © 2018 Designated Nerd Software. All rights reserved.
//

import UIKit

extension UIViewController {
  
  func showAlert(localizedTitle: Localized,
                 localizedMessage: Localized,
                 actions: [UIAlertAction]) {
    
    let alert = UIAlertController.alertWith(title: localizedTitle.value,
                                            message: localizedMessage.value,
                                            actions: actions)
    self.present(alert, animated: true)
    
  }
  
  func showOKAlert(localizedTitle: Localized,
                   localizedMessage: Localized,
                   okActionHandler: ((UIAlertAction) -> Void)? = nil) {
    self.showAlert(localizedTitle: localizedTitle,
                   localizedMessage: localizedMessage,
                   actions:  [ .okAction(handler: okActionHandler) ])

  }
  
  func showErrorOKAlert(localizedMessage: Localized,
                        okActionHandler: ((UIAlertAction) -> Void)? = nil) {
    showOKAlert(localizedTitle: .alert_title_error,
                localizedMessage: localizedMessage,
                okActionHandler: okActionHandler)
  }
}

extension UIAlertController {
  
  static func alertWith(title: String,
                        message: String,
                        actions: [UIAlertAction]) -> UIAlertController {
    let alertController = UIAlertController(title: title,
                                            message: message,
                                            preferredStyle: .alert)
    
    actions.forEach { alertController.addAction($0) }
    
    return alertController
  }
}

extension UIAlertAction {
  
  static func action(localizedTitle: Localized,
                     style: UIAlertActionStyle = .default,
                     handler: ((UIAlertAction) -> Void)? = nil) -> UIAlertAction {
    return UIAlertAction(title: localizedTitle.value,
                         style: style,
                         handler: handler)
  }
  
  static func okAction(handler: ((UIAlertAction) -> Void)? = nil) -> UIAlertAction {
    return self.action(localizedTitle: .alert_option_ok,
                       handler: handler)
  }
  
  static func cancelAction(handler: ((UIAlertAction) -> Void)? = nil) -> UIAlertAction {
    return self.action(localizedTitle: .alert_option_cancel,
                       style: .cancel,
                       handler: handler)
  }
}
