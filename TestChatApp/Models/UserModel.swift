//
//  UserModel.swift
//  TestChatApp
//
//  Created by Tes on 21/05/2023.
//

import Foundation

// MARK: - UserModel
struct UserModel {
    var userId, name, bio, username: String
    var photo: String
    
    var dictionary: [String: Any] {
      return [
        "userId": userId,
        "name": name,
        "bio": bio,
        "username": username,
        "photo": photo
      ]
    }
}
