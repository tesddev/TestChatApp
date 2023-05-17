//
//  AppButton.swift
//  TestChatApp
//
//  Created by Tes on 17/05/2023.
//

import UIKit

/// Button for the GIGGO App
///
/// Major properties:
/// - black colored
/// - corner radius 4
/// - font 14
///
/// Important properties to re-customize:
/// - setTitle
/// - addTarget
///
class AppButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setTitle("View Shipment", for: .normal)
        clipsToBounds = true
        titleLabel?.font = UIFont().useInterFont(ofSize: 16, weight: .regular)
        layer.cornerRadius = 4
        backgroundColor = UIColor(hexString: "#55A99D")
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

