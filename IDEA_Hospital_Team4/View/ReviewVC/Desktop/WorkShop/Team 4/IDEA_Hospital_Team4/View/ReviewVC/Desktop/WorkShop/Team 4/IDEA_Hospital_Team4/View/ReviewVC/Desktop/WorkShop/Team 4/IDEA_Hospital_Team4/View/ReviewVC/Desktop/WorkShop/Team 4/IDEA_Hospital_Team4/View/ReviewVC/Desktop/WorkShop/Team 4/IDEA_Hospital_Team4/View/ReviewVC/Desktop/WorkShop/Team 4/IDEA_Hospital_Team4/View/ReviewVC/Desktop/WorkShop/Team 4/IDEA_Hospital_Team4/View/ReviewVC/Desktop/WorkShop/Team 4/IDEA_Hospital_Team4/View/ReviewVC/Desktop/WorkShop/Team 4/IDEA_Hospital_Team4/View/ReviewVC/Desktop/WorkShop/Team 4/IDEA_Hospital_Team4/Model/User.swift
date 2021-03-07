//
//  User.swift
//  IDEA_Hospital_Team4
//
//  Created by Waleed on 12/7/20.
//  Copyright © 2020 IOS. All rights reserved.
//

import Foundation

struct User: Codable {
    
    let email: String
    let name: String
    let mobile: String
    let accessToken: String
    
    enum CodingKeys: String, CodingKey {
        case email, name, mobile
        case accessToken = "access_token"
    }
    
}
