//
//  PostResponseModel.swift
//  TestChatApp
//
//  Created by Tes on 21/05/2023.
//

import Foundation

// MARK: - PostResponseModel
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let postModel = try? JSONDecoder().decode(PostModel.self, from: jsonData)

import Foundation

struct PostResponseModel1: Codable {
    let link: String?
    let timestamp: Int
    let description, id: String?
    let video: Bool?
    let noMedia: Bool
    let userID: String
    let thumbnail: String?
    let username: String

    enum CodingKeys: String, CodingKey {
        case link, timestamp, description, id, video
        case noMedia = "no_media"
        case userID = "userId"
        case thumbnail, username
    }
}

