//
//  AppTextfield.swift
//  TestChatApp
//
//  Created by Tes on 17/05/2023.
//

import UIKit

/// Textfield for the  App
///
/// Major properties:
/// - font 13
/// - corner radius 8
///
/// Important properties to re-customize:
/// - placeholder
///

class AppTextfield: UITextField {
    override init(frame: CGRect) {
        super.init(frame: frame)
        textColor = .black
        translatesAutoresizingMaskIntoConstraints = false
        leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 0))
        leftViewMode = .always
        font = UIFont().useInterFont(ofSize: 13, weight: .regular)
        adjustsFontSizeToFitWidth = true
        textAlignment = .left
        backgroundColor = UIColor(hexString: "#F5FFFE")
        isUserInteractionEnabled = true
        layer.cornerRadius = 8
        layer.borderWidth = 1.5
        layer.borderColor = UIColor(hexString: "#DCF6F3").cgColor
        placeholder = "Enter username"
        autocorrectionType = .no
        autocapitalizationType = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
