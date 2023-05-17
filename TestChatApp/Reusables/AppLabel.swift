//
//  AppLabel.swift
//  TestChatApp
//
//  Created by Tes on 17/05/2023.
//

import UIKit

/// As the name implies
///
/// Major properties:
/// - black colored
/// - font size 24 - Bold
///
/// Important properties to re-customize:
/// - text
/// - size
///
class AppLabel: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        text = "Select Plan"
        font = UIFont().useInterFont(ofSize: 24, weight: .bold)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
