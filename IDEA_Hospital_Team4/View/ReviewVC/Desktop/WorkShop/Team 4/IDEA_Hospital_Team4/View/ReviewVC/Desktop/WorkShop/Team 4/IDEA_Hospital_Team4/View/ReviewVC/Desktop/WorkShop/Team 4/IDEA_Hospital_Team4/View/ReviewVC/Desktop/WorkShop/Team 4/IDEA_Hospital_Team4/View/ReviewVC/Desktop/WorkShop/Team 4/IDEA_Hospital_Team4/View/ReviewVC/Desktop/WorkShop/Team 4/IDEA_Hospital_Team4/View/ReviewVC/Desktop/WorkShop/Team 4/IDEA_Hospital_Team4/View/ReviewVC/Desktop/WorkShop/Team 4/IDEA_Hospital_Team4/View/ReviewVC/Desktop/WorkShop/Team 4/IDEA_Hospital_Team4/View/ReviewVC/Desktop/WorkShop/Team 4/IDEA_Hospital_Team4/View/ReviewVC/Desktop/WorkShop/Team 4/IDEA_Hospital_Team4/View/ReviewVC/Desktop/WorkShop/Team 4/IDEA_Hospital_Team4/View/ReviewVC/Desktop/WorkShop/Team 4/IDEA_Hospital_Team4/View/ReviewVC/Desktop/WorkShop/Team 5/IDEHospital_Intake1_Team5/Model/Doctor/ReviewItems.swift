//
//  ReviewItems.swift
//  IDEHospital_Intake1_Team5
//
//  Created by AbeerSharaf on 12/20/20.
//  Copyright © 2020 Abeer. All rights reserved.
//

import Foundation
struct ReviewItems : Codable {
    let id : Int
    let rating : Int
    let comment : String
    let commented_by : String

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case rating = "rating"
        case comment = "comment"
        case commented_by = "commented_by"
    }

}
