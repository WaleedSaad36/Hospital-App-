//
//  DoctorsReviewsWithPaginationResponse.swift
//  IDEHospital_Intake1_Team5
//
//  Created by AbeerSharaf on 12/20/20.
//  Copyright © 2020 Abeer. All rights reserved.
//

import Foundation
struct DoctorsReviewsWithPaginationResponse : Codable {
    let success : Bool
    let data : DoctorsReviewData
    let code : Int

    enum CodingKeys: String, CodingKey {

        case success = "success"
        case data = "data"
        case code = "code"
    }
}
