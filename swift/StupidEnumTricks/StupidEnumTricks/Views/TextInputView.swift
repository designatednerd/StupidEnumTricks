//
//  TextInputView.swift
//  StupidEnumTricks
//
//  Created by Ellen Shapiro on 5/10/18.
//  Copyright © 2018 Designated Nerd Software. All rights reserved.
//

import UIKit

enum TextInputState {
  case inactive
  case active
  case valid
  case error
  
  func color(from configurable: InputColorConfigurable) -> UIColor {
    switch self {
    case .inactive:
      return configurable.inactiveColor
    case .active:
      return configurable.activeColor
    case .valid:
      return configurable.validColor
    case .error:
      return configurable.errorColor
    }
  }
}

protocol InputColorConfigurable {
  
  var inactiveColor: UIColor { get set }
  var activeColor: UIColor { get set }
  var validColor: UIColor { get set }
  var errorColor: UIColor { get set }
}


@IBDesignable
class TextInputView: UIView, InputColorConfigurable {
  
  private lazy var titleLabel = UILabel()
  
  private lazy var textField: UITextField = {
    let textField = UITextField()
    textField.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      textField.heightAnchor.constraint(equalToConstant: 44)
    ])
    textField.borderStyle = .roundedRect
    textField.delegate = self
    
    return textField
  }()
  
  private lazy var underline: UIView = {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      view.heightAnchor.constraint(equalToConstant: 1)
    ])
    
    return view
  }()
  
  private lazy var messageLabel: UILabel = {
    let label = UILabel()
    label.font = .systemFont(ofSize: 12)
    label.numberOfLines = 0
    
    return label
  }()
  
  private lazy var stackView: UIStackView = {
    let stackView = UIStackView()
    stackView.translatesAutoresizingMaskIntoConstraints = false
    stackView.axis = .vertical
    stackView.distribution = .fill
    stackView.alignment = .fill
    stackView.spacing = 5
  
    return stackView
  }()
  
  var inputValidator: ((String?) -> ValidationResult)? = nil
  
  @IBOutlet var nextInput: TextInputView?
  
  @IBInspectable private var title: String? {
    didSet {
      self.titleLabel.text = self.title
      self.setNeedsDisplay()
    }
  }
  
  @IBInspectable private var placeholder: String? {
    didSet {
      self.textField.placeholder = self.placeholder
      self.setNeedsDisplay()
    }
  }
  
  @IBInspectable private var message: String? {
    didSet {
      self.messageLabel.text = self.message
      self.messageLabel.updateHiddenFromContent()
      self.setNeedsDisplay()
    }
  }
  
  var localizableMessage: Localized?  {
    didSet {
      self.message = self.localizableMessage?.value
    }
  }
  
  var text: String? {
    return self.textField.text
  }
  
  @IBInspectable var inactiveColor: UIColor = .darkText {
    didSet {
      self.configureColorForCurrentInputState()
    }
  }
  
  @IBInspectable var activeColor: UIColor = .blue {
    didSet {
      self.configureColorForCurrentInputState()
    }
  }
  
  @IBInspectable var validColor: UIColor = .green {
    didSet {
      self.configureColorForCurrentInputState()
    }
  }
  
  @IBInspectable var errorColor: UIColor = .red {
    didSet {
      self.configureColorForCurrentInputState()
    }
  }
  
  @IBInspectable var isSecureTextEntry: Bool = false {
    didSet {
      self.textField.isSecureTextEntry = self.isSecureTextEntry
    }
  }

  var inputState: TextInputState = .inactive {
    didSet {
      self.configureColorForCurrentInputState()
    }
  }
  
  // MARK: - View Setup
  
  private func commonSetup() {
    guard self.titleLabel.superview == nil else {
      // Already set up, just update the color
      self.configureColorForCurrentInputState()
      return
    }
    
    self.addSubview(stackView)
    NSLayoutConstraint.activate([
        stackView.topAnchor.constraint(equalTo: self.topAnchor),
        stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
        stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
    ])
    
    stackView.addArrangedSubview(titleLabel)
    stackView.addArrangedSubview(textField)
    stackView.addArrangedSubview(underline)
    stackView.addArrangedSubview(messageLabel)
    
    self.configureColorForCurrentInputState()
    self.setNeedsDisplay()
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    self.commonSetup()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    self.commonSetup()
  }
    
  override func prepareForInterfaceBuilder() {
    super.prepareForInterfaceBuilder()
    self.commonSetup()
  }
  
  override var intrinsicContentSize: CGSize {
    return stackView.intrinsicContentSize
  }
  
  override func becomeFirstResponder() -> Bool {
    return self.textField.becomeFirstResponder()
  }
  
  // MARK: - Localization
  
  func configure<T: TextInputLocalizable>(using type: T) {
    self.title = type.localizedTitle.value
    self.placeholder = type.localizedPlaceholder?.value
    self.isSecureTextEntry = type.isSecure
  }
  
  // MARK: - Configuration
  
  private func configureColorForCurrentInputState() {
    let color = self.inputState.color(from: self)
    self.underline.backgroundColor = color
    self.titleLabel.textColor = color
    self.messageLabel.textColor = color
    
    self.setNeedsDisplay()
  }
  
  // MARK: - Validation
  
  private func validateTextField() {
    guard let validator = self.inputValidator else {
      // Nothing to validate, whatever was input is valid.
      self.inputState = .valid
      return
    }
    
    let validationResult = validator(self.textField.text)
    
    if validationResult.isValid {
      self.inputState = .valid
      self.message = nil
    } else {
      self.inputState = .error
      self.message = validationResult.errorMessage
    }
  }
}

extension TextInputView: UITextFieldDelegate {
  
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    if let nextInput = self.nextInput {
      _ = nextInput.becomeFirstResponder()
    } else {
      self.endEditing(true)
    }
    return false
  }
  
  func textFieldDidEndEditing(_ textField: UITextField) {
    self.validateTextField()
  }
  
  func textFieldDidBeginEditing(_ textField: UITextField) {
    self.inputState = .active
  }
}
