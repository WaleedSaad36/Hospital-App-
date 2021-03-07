//
//  UserDoctorAppointmentData.swift
//  IDEHospital_Intake1_Team5
//
//  Created by AbeerSharaf on 12/20/20.
//  Copyright © 2020 Abeer. All rights reserved.
//

import Foundation
struct UserDoctorAppointmentData : Codable {
    let items : [AppointmentItems]
    let total : Int
    let page : Int
    let per_page : Int
    let total_pages : Int

    enum CodingKeys: String, CodingKey {

        case items = "items"
        case total = "total"
        case page = "page"
        case per_page = "per_page"
        case total_pages = "total_pages"
    }
}
