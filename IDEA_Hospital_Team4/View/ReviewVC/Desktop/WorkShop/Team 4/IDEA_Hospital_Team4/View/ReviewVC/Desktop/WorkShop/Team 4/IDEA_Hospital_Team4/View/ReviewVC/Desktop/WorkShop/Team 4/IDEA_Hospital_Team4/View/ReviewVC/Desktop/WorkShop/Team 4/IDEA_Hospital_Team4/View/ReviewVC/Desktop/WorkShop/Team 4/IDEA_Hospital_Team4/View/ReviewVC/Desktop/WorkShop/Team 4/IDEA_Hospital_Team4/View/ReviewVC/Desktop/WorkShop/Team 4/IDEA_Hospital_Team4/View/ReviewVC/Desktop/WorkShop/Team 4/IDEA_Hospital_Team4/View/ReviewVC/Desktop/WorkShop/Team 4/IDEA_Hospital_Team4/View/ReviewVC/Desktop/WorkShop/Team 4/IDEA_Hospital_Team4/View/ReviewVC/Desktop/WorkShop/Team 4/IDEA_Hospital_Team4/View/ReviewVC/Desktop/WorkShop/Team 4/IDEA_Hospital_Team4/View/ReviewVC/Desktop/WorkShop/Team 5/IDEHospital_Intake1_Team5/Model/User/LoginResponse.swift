//
//  LoginResponse.swift
//  IDEHospital_Intake1_Team5
//
//  Created by AbeerSharaf on 12/8/20.
//  Copyright © 2020 Abeer. All rights reserved.
//

import Foundation

struct LoginResponse: Codable {
    let data : UserData
    let code : Int
    let success : Bool

}
