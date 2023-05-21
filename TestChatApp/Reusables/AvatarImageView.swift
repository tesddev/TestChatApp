//
//  AvatarImageView.swift
//  TestChatApp
//
//  Created by Tes on 19/05/2023.
//

import UIKit

class AvatarImageView: UIImageView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentMode = .scaleAspectFill
        translatesAutoresizingMaskIntoConstraints = false
        image = UIImage(named: "avatar")
        layer.cornerRadius = 25
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
