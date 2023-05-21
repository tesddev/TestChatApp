//
//  MessageModel.swift
//  TestChatApp
//
//  Created by Tes on 21/05/2023.
//

import Foundation

struct MessageModel: Codable {
    let text: String?
    let timestamp: Int
    let description, id: String?
    let username: String
}
