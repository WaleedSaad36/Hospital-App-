//
//  DoctorAppointmentsResponse.swift
//  IDEHospital_Intake1_Team5
//
//  Created by AbeerSharaf on 12/20/20.
//  Copyright © 2020 Abeer. All rights reserved.
//

import Foundation
struct DoctorAppointmentsResponse : Codable {
    let success : Bool
    let code : Int
    let data : [AppointmentData]

    enum CodingKeys: String, CodingKey {

        case success = "success"
        case code = "code"
        case data = "data"
    }
}
