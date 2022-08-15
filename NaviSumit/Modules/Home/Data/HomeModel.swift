//
//  HomeModel.swift
//  NaviSumit
//
//  Created by Sumit Kumar on 15/08/22.
//

import Foundation

struct HomeModel: Decodable {
    let title: String?
    let username: String?
    let createdAt: String?
    let closedAt: String?
    let user: User

    enum CodingKeys: String, CodingKey {
        case createdAt = "created_at"
        case title
        case username
        case closedAt = "closed_at"
        case user
     }
}

struct User: Decodable {
    let userImageUrlString: String
    let login: String
    enum CodingKeys: String, CodingKey {
        case userImageUrlString = "avatar_url"
        case login
    }
}
