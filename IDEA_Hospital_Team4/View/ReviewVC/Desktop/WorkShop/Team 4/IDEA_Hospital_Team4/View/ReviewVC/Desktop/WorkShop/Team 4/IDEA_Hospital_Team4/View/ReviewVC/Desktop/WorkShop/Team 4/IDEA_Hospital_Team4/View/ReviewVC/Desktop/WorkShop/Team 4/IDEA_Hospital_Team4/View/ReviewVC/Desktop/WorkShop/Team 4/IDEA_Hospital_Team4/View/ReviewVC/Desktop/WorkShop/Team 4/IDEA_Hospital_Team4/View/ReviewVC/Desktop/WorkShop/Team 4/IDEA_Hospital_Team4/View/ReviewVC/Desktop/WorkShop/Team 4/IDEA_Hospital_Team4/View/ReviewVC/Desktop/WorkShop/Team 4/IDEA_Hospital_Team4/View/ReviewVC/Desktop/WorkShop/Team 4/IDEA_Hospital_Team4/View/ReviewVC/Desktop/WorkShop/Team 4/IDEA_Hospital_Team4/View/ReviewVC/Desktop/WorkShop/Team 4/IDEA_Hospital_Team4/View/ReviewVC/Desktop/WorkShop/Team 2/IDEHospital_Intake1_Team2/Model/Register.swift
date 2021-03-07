//
//  Register.swift
//  IDEHospital_Intake1_Team2
//
//  Created by Divo Ayman on 12/28/20.
//

import Foundation
struct SignUpResponse: Codable {
    
    
    let data: UserData?
    var success: Bool?
    var code: Int?
    
    enum CodingKeys: String, CodingKey {
        case data
        case success, code
    }
    
}

struct UserData: Codable {
    var id: Int
    var name, email: String
    var mobile: String
    let token: String
    enum CodingKeys: String, CodingKey {
        case name, email, mobile, id
        case token = "access_token"
    }
}

struct ResetResponse: Codable {
    var success: Bool?
    var code: Int?
    enum CodingKeys: String, CodingKey {
        case success, code
    }
    
}


