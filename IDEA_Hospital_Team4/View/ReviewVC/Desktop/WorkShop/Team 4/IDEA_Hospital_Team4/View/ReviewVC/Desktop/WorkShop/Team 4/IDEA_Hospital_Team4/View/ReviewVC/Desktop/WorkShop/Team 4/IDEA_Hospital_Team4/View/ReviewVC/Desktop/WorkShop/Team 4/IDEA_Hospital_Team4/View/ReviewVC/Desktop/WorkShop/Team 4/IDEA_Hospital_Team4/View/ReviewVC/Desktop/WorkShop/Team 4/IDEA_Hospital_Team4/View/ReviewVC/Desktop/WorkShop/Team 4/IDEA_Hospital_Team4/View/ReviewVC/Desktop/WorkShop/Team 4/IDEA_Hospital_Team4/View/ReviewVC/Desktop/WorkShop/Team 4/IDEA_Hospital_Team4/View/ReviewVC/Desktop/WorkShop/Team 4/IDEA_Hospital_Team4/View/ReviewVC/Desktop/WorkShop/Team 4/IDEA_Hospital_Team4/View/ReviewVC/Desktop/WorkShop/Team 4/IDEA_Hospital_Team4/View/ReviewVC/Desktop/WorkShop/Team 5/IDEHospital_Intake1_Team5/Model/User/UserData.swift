//
//  UserData.swift
//  IDEHospital_Intake1_Team5
//
//  Created by AbeerSharaf on 12/8/20.
//  Copyright © 2020 Abeer. All rights reserved.
//

import Foundation
struct UserData : Codable {
    let id : Int
    let name : String
    let email : String
    let mobile : String
    let access_token : String

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case name = "name"
        case email = "email"
        case mobile = "mobile"
        case access_token = "access_token"
    }
}
