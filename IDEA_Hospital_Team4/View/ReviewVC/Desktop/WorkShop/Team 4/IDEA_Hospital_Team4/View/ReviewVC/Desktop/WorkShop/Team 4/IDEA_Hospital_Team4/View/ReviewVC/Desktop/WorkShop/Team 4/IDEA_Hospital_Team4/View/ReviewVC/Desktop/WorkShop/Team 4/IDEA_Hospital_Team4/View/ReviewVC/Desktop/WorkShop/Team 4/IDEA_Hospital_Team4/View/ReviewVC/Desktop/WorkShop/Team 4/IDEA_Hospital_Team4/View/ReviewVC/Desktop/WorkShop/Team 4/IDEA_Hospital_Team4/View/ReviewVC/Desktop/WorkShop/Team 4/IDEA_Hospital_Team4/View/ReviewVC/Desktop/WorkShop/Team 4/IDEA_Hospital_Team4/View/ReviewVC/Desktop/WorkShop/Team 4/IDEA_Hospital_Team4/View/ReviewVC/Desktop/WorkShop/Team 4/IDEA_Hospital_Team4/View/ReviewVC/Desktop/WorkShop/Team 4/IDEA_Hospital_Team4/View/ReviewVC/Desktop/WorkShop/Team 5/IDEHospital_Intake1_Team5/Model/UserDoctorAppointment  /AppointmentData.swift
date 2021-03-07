//
//  AppointmentData.swift
//  IDEHospital_Intake1_Team5
//
//  Created by AbeerSharaf on 12/20/20.
//  Copyright © 2020 Abeer. All rights reserved.
//

import Foundation
struct AppointmentData : Codable {
    let date : Int
    let times : [String]

    enum CodingKeys: String, CodingKey {

        case date = "date"
        case times = "times"
    }
}
