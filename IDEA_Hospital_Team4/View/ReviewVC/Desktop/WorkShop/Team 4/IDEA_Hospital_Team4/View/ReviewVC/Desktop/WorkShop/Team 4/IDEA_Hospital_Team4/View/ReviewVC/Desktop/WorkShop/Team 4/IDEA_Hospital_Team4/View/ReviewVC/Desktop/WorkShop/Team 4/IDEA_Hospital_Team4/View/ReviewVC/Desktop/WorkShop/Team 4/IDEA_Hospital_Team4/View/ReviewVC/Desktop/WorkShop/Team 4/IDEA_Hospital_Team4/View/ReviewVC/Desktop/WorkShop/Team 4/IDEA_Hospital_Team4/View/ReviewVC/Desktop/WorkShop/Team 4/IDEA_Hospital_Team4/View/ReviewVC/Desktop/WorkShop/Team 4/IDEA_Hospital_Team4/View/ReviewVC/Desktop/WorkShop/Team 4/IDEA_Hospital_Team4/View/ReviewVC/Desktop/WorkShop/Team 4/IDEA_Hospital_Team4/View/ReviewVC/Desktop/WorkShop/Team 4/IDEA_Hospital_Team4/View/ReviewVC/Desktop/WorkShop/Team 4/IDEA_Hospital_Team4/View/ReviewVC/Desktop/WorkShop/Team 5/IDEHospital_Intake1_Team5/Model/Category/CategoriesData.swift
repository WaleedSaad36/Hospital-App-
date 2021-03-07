//
//  CategoriesData.swift
//  IDEHospital_Intake1_Team5
//
//  Created by AbeerSharaf on 12/14/20.
//  Copyright © 2020 Abeer. All rights reserved.
//

import Foundation
struct CategoriesData : Codable {
    let id : Int
    let name : String
    let image : String
    let color : String

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case name = "name"
        case image = "image"
        case color = "color"
    }

}

