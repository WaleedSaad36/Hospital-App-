//
//  AuthResponse.swift
//  IDEA_Hospital_Team4
//
//  Created by IDE Academy on 1/3/21.
//  Copyright © 2021 IOS. All rights reserved.
//

import Foundation

struct AuthResponse: Codable{
    let data: AuthData?
    let code: Int
    let success: Bool?
    let errors: AuthError?
    let message: String?
}

struct AuthData: Codable{
    let id: Int?
    let name: String?
    let email: String?
    let mobile: String?
    let accessToken: String?
    enum CodingKeys: String, CodingKey {
        case  id, name, email, mobile
        case accessToken = "access_token"
    }
}

struct AuthError: Codable{
    let email: [String]?
}
