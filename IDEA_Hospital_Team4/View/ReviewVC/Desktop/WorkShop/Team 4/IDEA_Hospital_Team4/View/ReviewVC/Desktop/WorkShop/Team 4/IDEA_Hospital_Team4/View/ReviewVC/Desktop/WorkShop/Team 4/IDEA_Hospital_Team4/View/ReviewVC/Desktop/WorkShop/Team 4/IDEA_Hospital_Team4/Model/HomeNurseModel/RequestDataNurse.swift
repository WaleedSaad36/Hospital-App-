//
//  RequestDataNurse.swift
//  IDEA_Hospital_Team4
//
//  Created by IDE Academy on 12/28/20.
//  Copyright © 2020 IOS. All rights reserved.
//

import Foundation

struct RequestDataNurse: Codable {
    
    let name: String?
    let email: String?
    let mobile: String?
    let message: String?
    
    enum CodingKeys: String, CodingKey{
        case name, mobile, message, email
    }
}
