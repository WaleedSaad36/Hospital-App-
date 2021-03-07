//
//  Main_categories_Response.swift
//  IDEHospital_Intake1_Team5
//
//  Created by AbeerSharaf on 12/14/20.
//  Copyright © 2020 Abeer. All rights reserved.
//

import Foundation
struct MainCategoriesResponse : Codable {
    let success : Bool
    let code : Int
    let data : [CategoriesData]
    enum CodingKeys: String, CodingKey {
        case success = "success"
        case code = "code"
        case data = "data"
    }
}
