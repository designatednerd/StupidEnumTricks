//
//  LocalizedString.swift
//  StupidEnumTricks
//
//  Created by Ellen Shapiro on 5/15/18.
//  Copyright © 2018 Designated Nerd Software. All rights reserved.
//

import Foundation

public enum Localized: String {
  case alert_option_ok
  case alert_option_cancel
  case alert_title_error
  
  case button_title_sign_in
  case button_title_sign_out
  case button_title_sign_up
  case button_title_terms_accept
  case button_title_terms_reject
  case button_title_view_terms
  
  case error_format_password_too_short
  case error_message_email_invalid
  case error_message_field_required
  case error_message_passwords_dont_match
  
  case input_placeholder_email
  case input_placeholder_password
  case input_title_email
  case input_title_password
  case input_title_password_confirm
  
  case sign_in_failure_alert_title
  case sign_in_failure_alert_message
  case sign_in_success_alert_title
  case sign_in_success_alert_message
  
  case terms_title
  case terms_legalese
  case terms_accepted_alert_title
  case terms_accepted_alert_message
  case terms_rejected_alert_title
  case terms_rejected_alert_message
  
  public var value: String {
    return NSLocalizedString(self.rawValue, comment: "")
  }
  
  public func formattedValue(with integer: Int) -> String {
    return String(format: self.value, integer)
  }
  
  public func formattedValue(with string: String) -> String {
    return String(format: self.value, string)
  }
}
